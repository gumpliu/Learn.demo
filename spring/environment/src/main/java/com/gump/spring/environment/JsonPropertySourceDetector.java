package com.gump.spring.environment;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.json.JsonParser;
import org.springframework.boot.json.JsonParserFactory;
import org.springframework.boot.json.YamlJsonParser;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MapPropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.IOException;
import java.util.Map;

//Json
@Slf4j
public class JsonPropertySourceDetector extends AbstractPropertySourceDetector {

    private static final JsonParser JSON_PARSER = JsonParserFactory.getJsonParser();

    private final static Logger logger = LoggerFactory.getLogger(JsonPropertySourceDetector.class);

    @Override
    public String[] getFileExtensions() {
        return new String[]{"json"};
    }

    @Override
    public void load(ConfigurableEnvironment environment, String name, Resource resource) throws IOException {
        try {
            Map<String, Object> map = JSON_PARSER.parseMap(getContentStringFromResource(resource));
            Map<String, Object> target = flatten(map);
            addPropertySource(environment, new MapPropertySource(name, target));
        } catch (Exception e) {
            logger.warn("加载Json文件属性到环境变量失败,name = {},resource = {}", name, resource);
        }
    }
}
//Properties
class PropertiesPropertySourceDetector extends AbstractPropertySourceDetector {

    @Override
    public String[] getFileExtensions() {
        return new String[]{"properties", "conf"};
    }

    @SuppressWarnings("unchecked")
    @Override
    public void load(ConfigurableEnvironment environment, String name, Resource resource) throws IOException {
        Map map = PropertiesLoaderUtils.loadProperties(resource);
        addPropertySource(environment, new MapPropertySource(name, map));
    }
}
//Yaml
@Slf4j
class YamlPropertySourceDetector extends AbstractPropertySourceDetector {

    private static final JsonParser YAML_PARSER = new YamlJsonParser();
    private final static Logger logger = LoggerFactory.getLogger(YamlPropertySourceDetector.class);


    @Override
    public String[] getFileExtensions() {
        return new String[]{"yaml", "yml"};
    }

    @Override
    public void load(ConfigurableEnvironment environment, String name, Resource resource) throws IOException {
        try {
            Map<String, Object> map = YAML_PARSER.parseMap(getContentStringFromResource(resource));
            Map<String, Object> target = flatten(map);
            addPropertySource(environment, new MapPropertySource(name, target));
        } catch (Exception e) {
            logger.warn("加载Yaml文件属性到环境变量失败,name = {},resource = {}", name, resource);
        }
    }
}