package com.yss.wordtopdf.poitl.datamodel;

import java.util.List;
import java.util.Map;

public class DataModel {
    private List<String> paragraphs;
    private Map<Object,List<String>> tables;

    public List<String> getParagraphs() {
        return paragraphs;
    }

    public void setParagraphs(List<String> paragraphs) {
        this.paragraphs = paragraphs;
    }

    public Map<Object, List<String>> getTables() {
        return tables;
    }

    public void setTables(Map<Object, List<String>> tables) {
        this.tables = tables;
    }
}
