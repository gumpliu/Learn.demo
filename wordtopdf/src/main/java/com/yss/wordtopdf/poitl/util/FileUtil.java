package com.yss.wordtopdf.poitl.util;

import java.io.File;

public class FileUtil {

    /**
     * 获取操作系统临时目录
     * @return
     */
    public static String getTmpdir(){
        String tmpdir=System.getProperty("java.io.tmpdir");
        return tmpdir;
    }

    /**
     * 在指定目录下创建文件夹
     * @param parent
     * @param folderName
     * @return
     */
    public static void makeDir(String parent,String folderName){
        File file=new File(parent+ File.separator +folderName);
        if(!file.exists()){//如果文件夹不存在
            file.mkdir();//创建文件夹
        }
    }

    /**
     * 删除文件
     * @param pathname
     * @return
     */
    public static boolean deleteFile(String pathname){
        boolean result = false;
        File file = new File(pathname);
        if (file.exists()) {
            file.delete();
            result = true;
        }
        return result;
    }

    public static void main(String[] args) {
        makeDir(getTmpdir(),"test");
    }
}
