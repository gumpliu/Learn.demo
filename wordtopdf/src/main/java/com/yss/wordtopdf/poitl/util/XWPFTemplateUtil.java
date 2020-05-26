package com.yss.wordtopdf.poitl.util;

import com.deepoove.poi.XWPFTemplate;
import com.deepoove.poi.config.Configure;
import com.deepoove.poi.config.ConfigureBuilder;
//import com.deepoove.poi.policy.HackLoopTableRenderPolicy;
import com.yss.wordtopdf.poitl.policy.ColumnLoopTableRenderPolicy;
import com.yss.wordtopdf.poitl.policy.PortionColumnRenderPolicy;
import com.yss.wordtopdf.poitl.policy.RowLoopTableRenderPolicy;

import java.io.File;
import java.io.IOException;

public class XWPFTemplateUtil {

//    private final static String OUT_DIRECTORY = FileUtil.getTmpdir();//根据模板经过数据填充后生成的word文件的保存路径  默认保存在操作系统的临时目录下
    private final static String OUT_DIRECTORY = "C:\\Users\\admin\\Desktop\\poi-tl\\out";

    /**
     * 默认实现
     * @param filePath 模板文件路径
     * @param data 需要给模板填充的数据
     * @throws IOException
     */
    public static void dataFill(String filePath, Object data) throws IOException {
        RowLoopTableRenderPolicy rowLoopTableRenderPolicy = new RowLoopTableRenderPolicy();//行循环动态新增
        ColumnLoopTableRenderPolicy columnRenderPolicy = new ColumnLoopTableRenderPolicy();//列循环动态新增
        PortionColumnRenderPolicy portionColumnRenderPolicy = new PortionColumnRenderPolicy();//局部列动态新增
        ConfigureBuilder builder = Configure.newBuilder();//配置类
        //自定义正则表达式
        builder.buildGrammerRegex("[\\w]+(\\$[\\w]+)*")
                .bind("R", rowLoopTableRenderPolicy)
                .bind("C",columnRenderPolicy)
                .bind("P",portionColumnRenderPolicy);

        dataFill(filePath,builder.build(),data);
    }

    /**
     * 需要进行自定义配置时使用此方法
     * @param filePath 模板文件路径
     * @param config 自定义配置类
     * @param data 需要给模板填充的数据
     * @throws IOException
     */
    public static void dataFill(String filePath, Configure config, Object data) throws IOException {
        XWPFTemplate template = XWPFTemplate.compile(filePath, config).render(data);
        String fileName = filePath.substring(filePath.lastIndexOf(File.separator)+1);
        String outFileName = OUT_DIRECTORY+ File.separator+fileName;
        template.writeToFile(outFileName);//使用poi-tl将根据模板填充好数据后的文件保存
        template.close();

        //将word转换成pdf
//        wordToPdf(outFileName,outFileName.replace("docx","pdf"));
    }

    /**
     * 将word转换成pdf
     * @param sourcePath 需要转换的word文件路径
     * @param targetPath 转成pdf文件的存放路径
     */
    private static void wordToPdf(String sourcePath,String targetPath){
        //将word转换为pdf
        Word2PDFUtil.doc2pdf(sourcePath,targetPath);
        //删除word文件
        FileUtil.deleteFile(sourcePath);
    }

//    public static void main(String[] args) {
//        try {
//            HackLoopTableRenderPolicy hackLoopTableRenderPolicy = new HackLoopTableRenderPolicy();
//            ColumnLoopTableRenderPolicy columnRenderPolicy = new ColumnLoopTableRenderPolicy();
//            PortionColumnRenderPolicy portionColumnRenderPolicy = new PortionColumnRenderPolicy();
//            ConfigureBuilder builder = Configure.newBuilder().
//                    addPlugin('%', columnRenderPolicy)
//                    .bind("goods", hackLoopTableRenderPolicy)
//                    .bind("labors", hackLoopTableRenderPolicy)
//                    .bind("table",columnRenderPolicy)
//                    .bind("columns",portionColumnRenderPolicy);
//            dataFill("C:\\Users\\admin\\Desktop\\poi-tl\\template\\test2.docx",builder.build(),null);//需要进行特殊配置 比如表格的横向或者纵向动态扩展，就需要进行自定义配置
//
//            dataFill("C:\\Users\\admin\\Desktop\\poi-tl\\template\\test2.docx",null);//无需进行特殊配置处理  普通模板文件处理
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}
