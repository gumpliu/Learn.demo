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
import org.openxmlformats.schemas.wordprocessingml.x2006.main.*;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 列动态扩展自定义插件
 * duanyongping
 */
public class ColumnLoopTableRenderPolicy implements RenderPolicy {

	private String prefix;
	private String suffix;

	public ColumnLoopTableRenderPolicy() {
		this("[", "]");
	}

	public ColumnLoopTableRenderPolicy(String prefix, String suffix) {
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
			int width = 0;
			if (null != data && data instanceof Iterable) {
				Iterator<?> iterator = ((Iterable<?>) data).iterator();
				TemplateResolver resolver = new TemplateResolver(template.getConfig().clone(prefix, suffix));
				Map<Integer,String> tempMap = new HashMap<>();
				boolean firstCheckFlag = false;
				XWPFTableCell tempCell = null;
				while (iterator.hasNext()){//遍历数据集合
					int count =0;
					Map map = (Map) iterator.next();
					if(firstCheckFlag){
						for (int j = 0; j < tempMap.size(); j++) {
							String text = tempMap.get(j);
							if(map.get(text.substring(text.indexOf(prefix)+1,text.indexOf(suffix)))==null){
								count++;
							}
						}
					}
					if(count==rows.size()){
						break;
					}
					RenderDataCompute dataCompute = template.getConfig().getRenderDataComputeFactory().newCompute(map);
					for(int i=0;i<rows.size();i++){
						XWPFTableRow row = rows.get(i);
						if(!firstCheckFlag){
							List<XWPFTableCell> tableCells = row.getTableCells();
							for (int j = 1; j < tableCells.size(); j++) {
								XWPFTableCell cell = tableCells.get(j);
								if(tempCell==null){
									tempCell = new XWPFTableCell(cell.getCTTc(),cell.getTableRow(), (IBody) cell.getPart());
								}
								if(cell.getText().startsWith(prefix)&&cell.getText().endsWith(suffix)){
									if(width==0){
										width = cell.getWidth();
									}
									tempMap.put(i,cell.getText());
									List<MetaTemplate> templates = resolver.resolveBodyElements(cell.getBodyElements());
									new DocumentProcessor(template, resolver, dataCompute).process(templates);
								}
							}
						}
						if(firstCheckFlag){
							XWPFTableCell newCell = row.addNewTableCell();
							newCell.getCTTc().setTcPr(tempCell.getCTTc().getTcPr());
							XWPFParagraph pa = newCell.getParagraphs().get(0);
							XWPFRun newRun = pa.insertNewRun(0);
							newRun.setText(tempMap.get(i),0);
							List<MetaTemplate> templates = resolver.resolveBodyElements(newCell.getBodyElements());
							new DocumentProcessor(template, resolver, dataCompute).process(templates);
						}
						if(i==rows.size()-1){
							firstCheckFlag = true;
						}
					}
				}
			}
			int columns = rows.get(0).getTableCells().size();
			CTTbl ttbl = table.getCTTbl();
			CTTblGrid grid = ttbl.getTblGrid();
			List<CTTblGridCol> glist = grid.getGridColList();
			for (int i = 1; i < glist.size(); i++) {
				CTTblGridCol col = glist.get(i);
				col.setW(BigInteger.valueOf(width/columns));
			}
			TableTools.widthTable(table, MiniTableRenderData.WIDTH_A4_FULL,columns);
			run.setText("", 0);
		}catch (Exception e){
			throw new RenderException("ColumnLoopTable for " + eleTemplate + "error: " + e.getMessage(), e);
		}
	}
}
