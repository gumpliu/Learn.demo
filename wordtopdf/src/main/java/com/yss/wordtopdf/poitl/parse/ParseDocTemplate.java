package com.yss.wordtopdf.poitl.parse;

import com.yss.wordtopdf.poitl.datamodel.DataModel;
import org.apache.poi.xwpf.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 解析poi-tl语法的word模板
 */
public class ParseDocTemplate {

    public final static String TEMPLATE_DIRECTORY = "C:\\Users\\admin\\Desktop\\poi-tl\\template"; //经过poi-tl语法转换后的word模板路径

    private final static Map<String, DataModel> maps = new ConcurrentHashMap();//map存放整个文档的paragraph和table内容

    /**
     * 读取整个目录下的文件并解析
     * @param source word模板路径
     */
    public void readDirectory(String source){
        File file = new File(source);
        if(file.isDirectory()){
            File[] tempList = file.listFiles();
            for(int i=0;i<tempList.length;i++){
                if(tempList[i].isFile()){
                    readFile(tempList[i]);
                }
            }
        }
    }

    /**
     * 解析指定文件
     * @param file
     */
    public void readFile(File file){
        XWPFDocument document = null;
        try {
            DataModel dataModel = new DataModel();
            document = new XWPFDocument(new FileInputStream(file));
            // 获取所有段落
            List<XWPFParagraph> paragraphs = document.getParagraphs();
            parseParagraph(paragraphs,dataModel);
            // 获取所有表格
            List<XWPFTable> tables = document.getTables();
            parseTable(tables,dataModel);
            maps.put(file.getName(),dataModel);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void parseParagraph(List<XWPFParagraph> paragraphs,DataModel dataModel){
        List<String> list = new ArrayList<>();
        for(int i=0;i<paragraphs.size();i++){
            XWPFParagraph paragraph = paragraphs.get(i);
            String text = paragraph.getText();
            if(null!=text&&!"".equals(text)&&text.contains("{{")&&text.contains("}}")){
                list.add(text.substring(text.lastIndexOf("{")+1,text.indexOf("}")));
            }
        }
        dataModel.setParagraphs(list);
    }

    private void parseTable(List<XWPFTable> tables,DataModel dataModel){
        Map<Object,List<String>> map = new LinkedHashMap<>(tables.size());
        for (int i=0;i<tables.size();i++) {
            List<String> cells = new ArrayList<>();
            XWPFTable table = tables.get(i);
            // 获取表格的行
            parseTable(table,cells);
            if(table.getText().contains("#")){
                String text = table.getText();
                String tableName = text.substring(text.indexOf("#"),text.indexOf("}"));
                map.put(tableName,cells);
            }else{
                map.put(i,cells);
            }
        }
        dataModel.setTables(map);
    }

    private synchronized void parseTable(XWPFTable table,List<String> cells){
        List<XWPFTableRow> rows = table.getRows();
        for (XWPFTableRow row : rows) {
            // 获取表格的每个单元格
            List<XWPFTableCell> tableCells = row.getTableCells();
            for (XWPFTableCell cell : tableCells) {
                // 获取单元格的内容
                List<IBodyElement> list = cell.getBodyElements();
                for(int i=0;i<list.size();i++){
                    if(list.get(i) instanceof XWPFTable){
                        XWPFTable tablel2 = (XWPFTable) list.get(i);
                        parseTable(tablel2,cells);
                    }else{
                        XWPFParagraph cpa = (XWPFParagraph) list.get(i);
                        String text = cpa.getText().trim();
                        if(null!=text&&!"".equals(text)&&text.contains("{{")&&text.contains("}}")){
                            cells.add(text.substring(text.lastIndexOf("{")+1,text.indexOf("}")));
                        }
                    }
                }
            }
        }
    }

    public Map<String, DataModel> getMaps() {
        return maps;
    }

    public static void main(String[] args) {
        ParseDocTemplate doc = new ParseDocTemplate();
        doc.readDirectory(TEMPLATE_DIRECTORY);
    }
}
