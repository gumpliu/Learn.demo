package com.yss.wordtopdf;

import com.yss.wordtopdf.poitl.parse.ParseDocTemplate;
import com.yss.wordtopdf.poitl.util.XWPFTemplateUtil;
import org.junit.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class XWPFTemplateColumnTest {

    ParseDocTemplate doc = new ParseDocTemplate();

    /**
     * 解析模板文件
     */
    public void init() {
        doc.readDirectory(ParseDocTemplate.TEMPLATE_DIRECTORY);
    }

    @SuppressWarnings("serial")
    @Test
    public void testRenderMap() throws Exception {
//        c1   c2     c3    c4     c5    c6
//        11   22    33     44    55    66
//        11   22    33     44    55    66
//        11   null   null    44    55    66
//        null null  null   444  555   666
//        tt    null  null   111  111   null
//        tt    null  null   111  111   null
        Map<String, Object> datas = new HashMap<String, Object>();
        List lists = new ArrayList();
        Map <String, Object> data = new HashMap<>();
        data.put("name","111");
        data.put("sex","222");
        data.put("age","333");
        data.put("remark","444");
        data.put("name2","555");
        data.put("sex2","666");
        data.put("age2","777");
        data.put("remark2","888");
        lists.add(data);
        lists.add(data);
        Map <String, Object> data2 = new HashMap<>();
        data2.put("name","111");
        data2.put("sex",null);
        data2.put("age",null);
        data2.put("remark",null);
        data2.put("name2","555");
        data2.put("sex2","666");
        data2.put("age2","777");
        data2.put("remark2","888");
        lists.add(data2);
        lists.add(data2);
        Map <String, Object> data3 = new HashMap<>();
        data3.put("name",null);
        data3.put("sex",null);
        data3.put("age",null);
        data3.put("remark",null);
        data3.put("name2","555");
        data3.put("sex2","666");
        data3.put("age2","777");
        data3.put("remark2","888");
        lists.add(data3);
        lists.add(data3);
        List plists = new ArrayList();
        Map <String, Object> pdata = new HashMap<>();
        pdata.put("name","111");
        pdata.put("sex","222");
        pdata.put("age","333");
        datas.put("R",lists);
        datas.put("C",lists);
        datas.put("P",plists);
        XWPFTemplateUtil.dataFill("C:\\Users\\admin\\Desktop\\poi-tl\\template\\test2.docx",datas);
    }
}

