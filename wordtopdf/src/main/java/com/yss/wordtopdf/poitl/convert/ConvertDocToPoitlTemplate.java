package com.yss.wordtopdf.poitl.convert;

import com.yss.wordtopdf.poitl.datamodel.DataModel;
import org.apache.poi.xwpf.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 解析原始docx模板 并按照poi-tl语法格式转换
 */
public class ConvertDocToPoitlTemplate {

    public final static String SOURCE_DIRECTORY = "C:\\Users\\admin\\Desktop\\poi-tl"; //原始word模板路径
    public final static String TARGET_DIRECTORY = "C:\\Users\\admin\\Desktop\\poi-tl\\template"; //经过poi-tl语法转换后的word模板路径
    private final Map<String, DataModel> maps = new ConcurrentHashMap();//map 文档 章节 章节内容的缓存信息

    /**
     * 读取整个目录下的文件
     * @param source  原始word模板路径
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
            document.write(new FileOutputStream(TARGET_DIRECTORY+ File.separator+file.getName()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void parseParagraph(List<XWPFParagraph> paragraphs,DataModel dataModel){
        List<String> list = new ArrayList<>();
        for(int i=0;i<paragraphs.size();i++){
            XWPFParagraph paragraph = paragraphs.get(i);
            String text = paragraph.getText();
            if(null!=text&&!"".equals(text)&&text.contains("=")){
                List<IRunElement> iruns = paragraph.getIRuns();
                for(int j=0;j<iruns.size();j++){
                    XWPFRun irun = (XWPFRun) iruns.get(j);
                    text = irun.text();
                    if(null!=text&&!"".equals(text)&&text.contains("=")) {
                        text = text.replace(".","$");
//                        irun.setText(text,0);
//                        list.add(text.trim().substring(text.indexOf("=") + 1));
                        if (text.endsWith(" ")) {
                            irun.setText(text.substring(0, text.indexOf("="))+"{{" + text.substring(text.indexOf("=") + 1, text.lastIndexOf(" ")) + "}} ",0);
                        } else if (text.startsWith(" ")) {
                            irun.setText(text.substring(0, text.indexOf("=")) + "{{" + text.substring(text.indexOf("=") + 1) + "}}",0);
                        } else {
                            if(text.contains("@")){
                                irun.setText(text.substring(0, text.indexOf("=")) + "{{" + text.substring(text.indexOf("=") + 1) + "}}",0);
                            }else {
                                irun.setText(text.substring(0, text.indexOf("=")) + "{{" + text.substring(text.indexOf("=") + 1) + "}}",0);
                            }
                        }
                    }
                }
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
            map.put(i,cells);
        }
        dataModel.setTables(map);
    }

    private synchronized void parseTable(XWPFTable table,List<String> cells){
        String prefix = "{{";
        String suffix = "}}";
        if(table.getText().contains("#")){
            prefix = "[";
            suffix = "]";
        }
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
                        if(null!=text&&!"".equals(text)&&text.contains("=")) {
                            List<IRunElement> iruns = cpa.getIRuns();
                            for(int j=0;j<iruns.size();j++){
                                XWPFRun irun = (XWPFRun) iruns.get(j);
                                text = irun.text();
                                text = text.replace(".","$");
                                if(null!=text&&!"".equals(text)&&text.contains("=")) {
                                    if (text.endsWith(" ")) {
                                        irun.setText(text.substring(0, text.indexOf("="))+ prefix + text.substring(text.indexOf("=") + 1, text.lastIndexOf(" ")) + suffix + " ",0);
                                    } else if (text.startsWith(" ")) {
                                        irun.setText(text.substring(0, text.indexOf("=")) + prefix + text.substring(text.indexOf("=") + 1) + suffix,0);
                                    } else {
                                        if(text.contains("@")){
                                            irun.setText(text.substring(0, text.indexOf("=")) + prefix + text.substring(text.indexOf("=") + 1) + suffix,0);
                                        }else {
                                            irun.setText(text.substring(0, text.indexOf("=")) + prefix + text.substring(text.indexOf("=") + 1) + suffix,0);
                                        }
                                    }
                                }
                            }
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
        ConvertDocToPoitlTemplate doc = new ConvertDocToPoitlTemplate();
        doc.readDirectory(SOURCE_DIRECTORY);
    }
}
