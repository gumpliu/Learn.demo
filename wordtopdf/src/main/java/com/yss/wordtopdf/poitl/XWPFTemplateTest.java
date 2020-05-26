package com.yss.wordtopdf.poitl;

import com.deepoove.poi.config.Configure;
import com.deepoove.poi.config.ConfigureBuilder;
import com.deepoove.poi.data.PictureRenderData;
import com.deepoove.poi.policy.HackLoopTableRenderPolicy;
import com.deepoove.poi.util.BytePictureUtils;
import com.yss.wordtopdf.poitl.datamodel.DataModel;
import com.yss.wordtopdf.poitl.parse.ParseDocTemplate;
import com.yss.wordtopdf.poitl.policy.ColumnLoopTableRenderPolicy;
import com.yss.wordtopdf.poitl.policy.PortionColumnRenderPolicy;
import com.yss.wordtopdf.poitl.util.XWPFTemplateUtil;
import org.junit.Test;

import java.util.*;

public class XWPFTemplateTest {

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
        init();

        Map<String, DataModel> maps = doc.getMaps();
        Map<String, Object> datas = new HashMap<String, Object>();
        if(maps!=null&&maps.size()>0){
            Set<String> names = maps.keySet();
            Iterator<String> it = names.iterator();
            while (it.hasNext()) {
                String name = it.next();
                DataModel dataModel = maps.get(name);
                List<String> paras = dataModel.getParagraphs();
                for(int i=0;i<paras.size();i++){
                    datas.put(paras.get(i),"测试数据"+(i+1));
                }
                Map<Object, List<String>> tables = dataModel.getTables();
                Set<Object> tableNames = tables.keySet();
                for(Object tableName : tableNames){
                    if(!tableName.toString().contains("#")){
                        List<String> list = tables.get(tableName);
                        for(int j = 0;j<list.size();j++){
                            datas.put(list.get(j),"表格测试数据"+j);
                        }
                    }
                }

                List<Map<String,Object>> goods = new ArrayList<>();
                Map<String,Object> good = new HashMap<>();
                good.put("count",4);
                good.put("name","墙纸");
                good.put("desc","书房卧室");
                good.put("discount",1500);
                good.put("tax",new Random().nextInt(10) + 20);
                good.put("price",400);
                good.put("totalPrice",1600);
                good.put("picture",new PictureRenderData(24, 24, ".png", BytePictureUtils.getUrlBufferedImage("http://deepoove.com/images/icecream.png")));

                goods.add(good);
                goods.add(good);
                goods.add(good);
//                datas.put("test2","张三");
//                datas.put("test3","张三");
                datas.put("goods",goods);

                List<Map<String,Object>> labors = new ArrayList<>();
                Map<String,Object> labor = new HashMap<>();
                labor.put("category","油漆工");
                labor.put("people",2);
                labor.put("price",400);
                labor.put("totalPrice",1600);
                labors.add(labor);
                labors.add(labor);
                datas.put("labors",labors);

                List<Map<String,Object>> tests = new ArrayList<>();
                Map<String,Object> table = new HashMap<>();
                table.put("jjmc","111");
                table.put("jjjc","222");
                table.put("jjzdm","444");
                table.put("qdjydm","777");
                tests.add(table);//动态添加数据
                tests.add(table);//动态添加数据
                tests.add(table);//动态添加数据
                datas.put("tests",tests);

                List<Map<String,Object>> columns = new ArrayList<>();
                Map<String,Object> column = new HashMap<>();
                column.put("jjglr","张三");
                column.put("jjtgr","李四");
                List fjjjjc = new ArrayList<String>();
                fjjjjc.add("长城货币A");
                fjjjjc.add("长城货币B");
//                fjjjjc.add("长城货币C");
                column.put("fjjjjc",fjjjjc);
                List cnjc = new ArrayList<String>();
                cnjc.add("AAA");
                cnjc.add("BBB");
//                cnjc.add("CCC");
                column.put("cnjc",cnjc);
                List fjjjjydm = new ArrayList<String>();
                fjjjjydm.add("20003");
                fjjjjydm.add("20004");
//                fjjjjydm.add("20005");
                column.put("fjjjjydm",fjjjjydm);
                List fjjjfeze = new ArrayList<String>();
                fjjjfeze.add("1234");
                fjjjfeze.add("2345");
//                fjjjfeze.add("3456");
                column.put("fjjjfeze",fjjjfeze);
                List fxsytz = new ArrayList<String>();
                fxsytz.add("111");
                fxsytz.add("222");
//                fxsytz.add("333");
                column.put("fxsytz",fxsytz);
                columns.add(column);

                datas.put("columns",columns);

                XWPFTemplateUtil.dataFill("C:\\Users\\admin\\Desktop\\poi-tl\\template\\test2.docx",datas);
            }
        }
    }
}

