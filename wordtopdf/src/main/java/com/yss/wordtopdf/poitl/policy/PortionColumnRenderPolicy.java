package com.yss.wordtopdf.poitl.policy;

import com.deepoove.poi.XWPFTemplate;
import com.deepoove.poi.data.MiniTableRenderData;
import com.deepoove.poi.exception.RenderException;
import com.deepoove.poi.policy.RenderPolicy;
import com.deepoove.poi.render.compute.RenderDataCompute;
import com.deepoove.poi.render.processor.DocumentProcessor;
import com.deepoove.poi.resolver.TemplateResolver;
import com.deepoove.poi.template.ElementTemplate;
import com.deepoove.poi.template.MetaTemplate;
import com.deepoove.poi.template.run.RunTemplate;
import com.deepoove.poi.util.TableTools;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTbl;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblGrid;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblGridCol;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTcPr;

import java.math.BigInteger;
import java.util.Iterator;
import java.util.List;

/**
 * 部分列动态扩展自定义插件
 * duanyongping
 */
public class PortionColumnRenderPolicy implements RenderPolicy {

	private String prefix;
	private String suffix;

	public PortionColumnRenderPolicy() {
		this("[", "]");
	}

	public PortionColumnRenderPolicy(String prefix, String suffix) {
		this.prefix = prefix;
		this.suffix = suffix;
	}

	@Override
	public void render(ElementTemplate eleTemplate, Object data, XWPFTemplate template) {
		RunTemplate runTemplate  = (RunTemplate) eleTemplate;
		XWPFRun run = runTemplate.getRun();

		try {
			XWPFTableCell tagCell = (XWPFTableCell) ((XWPFParagraph) run.getParent()).getBody();
			XWPFTable table = tagCell.getTableRow().getTable();
			List<XWPFTableRow> rows = table.getRows();
			if (null != data && data instanceof Iterable) {
				Iterator<?> iterator = ((Iterable<?>) data).iterator();
				TemplateResolver resolver = new TemplateResolver(template.getConfig().clone(prefix, suffix));
				while (iterator.hasNext()){//遍历数据集合
					RenderDataCompute dataCompute = template.getConfig().getRenderDataComputeFactory().newCompute(iterator.next());
					for(int i=0;i<rows.size();i++){
						XWPFTableRow row = rows.get(i);
						List<XWPFTableCell> tableCells = row.getTableCells();
						for (int j = 1; j < tableCells.size(); j++) {
							XWPFTableCell cell = tableCells.get(j);
							if(cell.getText().startsWith(prefix)&&cell.getText().endsWith(suffix)){
								List<MetaTemplate> templates = resolver.resolveBodyElements(cell.getBodyElements());
								new DocumentProcessor(template, resolver, dataCompute).process(templates);
							}else{
								List<IBodyElement> bodyElements = cell.getBodyElements();
								for (int k = 0; k < bodyElements.size(); k++) {
									IBodyElement bodyElement = bodyElements.get(k);
									if(bodyElement instanceof XWPFTable){
										XWPFTable childTable = (XWPFTable) bodyElement;
										String text = ((XWPFTable) bodyElement).getText();
										String el = text.substring(text.indexOf("[")+1,text.indexOf("]"));
										List<Object> list = (List<Object>) dataCompute.compute(el);
										tableHandler(childTable,list);
									}
								}
							}
						}
					}
				}
			}
			run.setText("", 0);
		}catch (Exception e){
			throw new RenderException("ColumnLoopTable for " + eleTemplate + "error: " + e.getMessage(), e);
		}
	}

	private void tableHandler(XWPFTable table,List<Object> data){
		boolean firstFlag = false;
		List<XWPFTableRow> rows = table.getRows();
		for(int i=0;i<rows.size();i++){
			XWPFTableRow row = rows.get(i);
			if(data!=null&&data.size()>1){
				CTTcPr tcpr = null;
				int width = 0;
				for (int j = 0; j < data.size(); j++) {
					if(!firstFlag){
						List<XWPFTableCell> tableCells = row.getTableCells();
						XWPFTableCell cell = tableCells.get(0);
						if(tcpr==null){
							tcpr = cell.getCTTc().getTcPr();
						}
						if(width==0){
							width = cell.getWidth();
						}
						if(cell.getText().contains(prefix)&&cell.getText().contains(suffix)){
							List<IBodyElement> list = cell.getBodyElements();
							XWPFParagraph cpa = (XWPFParagraph) list.get(0);
							List<IRunElement> iruns = cpa.getIRuns();
							XWPFRun irun = (XWPFRun) iruns.get(0);
							irun.setText((String) data.get(j),0);
						}
						firstFlag = true;
					}else{
						XWPFTableCell newCell = row.addNewTableCell();
						newCell.getCTTc().setTcPr(tcpr);
						XWPFParagraph pa = newCell.getParagraphs().get(0);
						XWPFRun newRun = pa.insertNewRun(0);
						newRun.setText((String) data.get(j),0);
					}
					if(j==data.size()-1){
						int columns = rows.get(0).getTableCells().size();
						CTTbl ttbl = table.getCTTbl();
						CTTblGrid grid = ttbl.getTblGrid();
						List<CTTblGridCol> glist = grid.getGridColList();
						for (int k = 0; k < glist.size(); k++) {
							CTTblGridCol col = glist.get(i);
							col.setW(BigInteger.valueOf(width/columns));
						}
						TableTools.widthTable(table, MiniTableRenderData.WIDTH_A4_FULL,columns);
					}
				}
			}else {
				List<XWPFTableCell> tableCells = row.getTableCells();
				XWPFTableCell cell = tableCells.get(0);
				if(cell.getText().startsWith(prefix)&&cell.getText().endsWith(suffix)){
					List<IBodyElement> list = cell.getBodyElements();
					XWPFParagraph cpa = (XWPFParagraph) list.get(0);
					List<IRunElement> iruns = cpa.getIRuns();
					XWPFRun irun = (XWPFRun) iruns.get(0);
					if(data!=null&&data.size()==1){
						irun.setText((String) data.get(0),0);
					}else{
						irun.setText("-",0);
					}
				}
			}
		}
	}
}


//				List<XWPFTableCell> tableCells = row.getTableCells();
//				for (int j = 0; j < tableCells.size(); j++) {
//					XWPFTableCell cell = tableCells.get(j);
//					if(cell.getText().startsWith(prefix)&&cell.getText().endsWith(suffix)){
//						// 获取单元格的内容
//						List<IBodyElement> list = cell.getBodyElements();
//						for (int k = 0; k < list.size(); k++) {
//							XWPFParagraph cpa = (XWPFParagraph) list.get(k);
//							String text = cpa.getText().trim();
//							if(text.startsWith(prefix)&&text.endsWith(suffix)){
//								List<IRunElement> iruns = cpa.getIRuns();
//								for (int l = 0; l < iruns.size(); l++) {
//									XWPFRun irun = (XWPFRun) iruns.get(l);
//									irun.setText((String) data.get(0),0);
//								}
//							}
//						}
//					}
//				}