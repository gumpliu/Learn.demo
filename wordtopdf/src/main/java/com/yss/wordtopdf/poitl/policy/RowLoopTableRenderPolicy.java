package com.yss.wordtopdf.poitl.policy;

import com.deepoove.poi.XWPFTemplate;
import com.deepoove.poi.exception.RenderException;
import com.deepoove.poi.policy.RenderPolicy;
import com.deepoove.poi.render.compute.RenderDataCompute;
import com.deepoove.poi.render.processor.DocumentProcessor;
import com.deepoove.poi.resolver.TemplateResolver;
import com.deepoove.poi.template.ElementTemplate;
import com.deepoove.poi.template.MetaTemplate;
import com.deepoove.poi.template.run.RunTemplate;
import com.deepoove.poi.util.ReflectionUtils;
import com.deepoove.poi.util.TableTools;
import org.apache.poi.xwpf.usermodel.*;
import org.apache.xmlbeans.XmlCursor;
import org.apache.xmlbeans.XmlObject;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTRow;

import java.util.Iterator;
import java.util.List;

public class RowLoopTableRenderPolicy implements RenderPolicy {
    private String prefix;
    private String suffix;

    public RowLoopTableRenderPolicy() {
        this("[", "]");
    }

    public RowLoopTableRenderPolicy(String prefix, String suffix) {
        this.prefix = prefix;
        this.suffix = suffix;
    }

    public void render(ElementTemplate eleTemplate, Object data, XWPFTemplate template) {
        RunTemplate runTemplate = (RunTemplate)eleTemplate;
        XWPFRun run = runTemplate.getRun();

        try {
            if (!TableTools.isInsideTable(run)) {
                throw new IllegalStateException("The template tag " + runTemplate.getSource() + " must be inside a table");
            } else {
                XWPFTableCell tagCell = (XWPFTableCell)((XWPFParagraph)run.getParent()).getBody();
                XWPFTableRow tagRow = tagCell.getTableRow();
                XWPFTable table = tagCell.getTableRow().getTable();
                int templateRowIndex = this.getRowIndex(table, tagRow) + 1;
                if(tagCell.getCTTc().getTcPr().getVMerge()!=null){//判断表头是否有行合并
                    while (true){
                        XWPFTableCell cell = table.getRow(templateRowIndex).getCell(0);
                        if(cell.getText().startsWith(prefix)){
                            break;
                        }
                        templateRowIndex ++;
                    }
                }
                if (null != data && data instanceof Iterable) {
                    Iterator<?> iterator = ((Iterable)data).iterator();
                    XWPFTableRow templateRow = table.getRow(templateRowIndex);
                    TemplateResolver resolver = new TemplateResolver(template.getConfig().clone(this.prefix, this.suffix));

                    while(iterator.hasNext()) {
                        int insertPosition = templateRowIndex++;
                        table.insertNewTableRow(insertPosition);
                        this.setTableRow(table, templateRow, insertPosition);
                        XmlCursor newCursor = templateRow.getCtRow().newCursor();
                        newCursor.toPrevSibling();
                        XmlObject object = newCursor.getObject();
                        XWPFTableRow nextRow = new XWPFTableRow((CTRow)object, table);
                        this.setTableRow(table, nextRow, insertPosition);
                        RenderDataCompute dataCompute = template.getConfig().getRenderDataComputeFactory().newCompute(iterator.next());
                        List<XWPFTableCell> cells = nextRow.getTableCells();
                        cells.forEach((cell) -> {
                            List<MetaTemplate> templates = resolver.resolveBodyElements(cell.getBodyElements());
                            (new DocumentProcessor(template, resolver, dataCompute)).process(templates);
                        });
                        int count = 0;
                        for (int i = 0; i < cells.size(); i++) {
                            if("".equals(cells.get(i).getText())){
                                count ++;
                            }
                        }
                        if(cells.size()==count){
                            table.removeRow(insertPosition);
                            templateRowIndex--;
                            break;
                        }
                    }
                }

                run.setText("", 0);
                table.removeRow(templateRowIndex);
            }
        } catch (Exception var19) {
            throw new RenderException("HackLoopTable for " + eleTemplate + "error: " + var19.getMessage(), var19);
        }
    }

    private void setTableRow(XWPFTable table, XWPFTableRow templateRow, int pos) {
        List<XWPFTableRow> rows = (List) ReflectionUtils.getValue("tableRows", table);
        rows.set(pos, templateRow);
        table.getCTTbl().setTrArray(pos, templateRow.getCtRow());
    }

    private int getRowIndex(XWPFTable table, XWPFTableRow row) {
        List<XWPFTableRow> rows = table.getRows();
        return rows.indexOf(row);
    }
}
