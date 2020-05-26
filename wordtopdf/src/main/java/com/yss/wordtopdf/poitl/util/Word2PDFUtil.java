package com.yss.wordtopdf.poitl.util;

import java.io.*;

import com.aspose.words.Document;
import com.aspose.words.SaveFormat;
import org.jodconverter.LocalConverter;
import org.jodconverter.document.DefaultDocumentFormatRegistry;
import org.jodconverter.filter.text.PageMarginsFilter;
import org.jodconverter.office.LocalOfficeManager;
import org.jodconverter.office.OfficeException;

public class Word2PDFUtil {

    public static void main(String[] args) {
        doc2pdf("C:\\Users\\admin\\Desktop\\poi-tl\\template\\test.docx","C:\\Users\\admin\\Desktop\\poi-tl\\template\\test.pdf");
    }

    /**
     * 方案一、将world转换成pdf 使用LibreOffice，需要安装LibreOffice
     */
    public static void doc2PDF(String inPath, String outPath){
        LocalOfficeManager officeManager = null;
        InputStream input = null;
        OutputStream output = null;
        officeManager = LocalOfficeManager.builder().officeHome("C:\\Program Files\\LibreOffice 5").portNumbers(8100).install().build();
        try {
            officeManager.start();
        } catch (OfficeException e) {
            e.printStackTrace();
        }

        try {
            input = new FileInputStream(inPath);
            output = new FileOutputStream(outPath);

            PageMarginsFilter pageMarginsFilter = new PageMarginsFilter(20,20,20,20);
            LocalConverter.builder().officeManager(officeManager)
                    .filterChain(pageMarginsFilter)
                    .build()
                    .convert(input)
                    .as(DefaultDocumentFormatRegistry.DOCX)
                    .to(output)
                    .as(DefaultDocumentFormatRegistry.PDF).execute();
            output.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                input.close();
                output.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * 方案二、将world转换成pdf 使用aspose.jar包引入的方式
     * @param inPath
     * @param outPath
     */
    public static void doc2pdf(String inPath, String outPath) {
        FileOutputStream os =null;
        try {
            File file = new File(outPath); // 新建一个空白pdf文档
            os = new FileOutputStream(file);
            Document doc = new Document(inPath); // Address是将要被转化的word文档
            doc.save(os, SaveFormat.PDF);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(os!=null){
                try {
                    os.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
