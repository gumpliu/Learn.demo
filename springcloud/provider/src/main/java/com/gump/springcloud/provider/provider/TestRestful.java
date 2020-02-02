package com.gump.springcloud.provider.provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestRestful {

    private final Logger logger=LoggerFactory.getLogger(getClass());

    @Autowired
    private DiscoveryClient client;

    @RequestMapping(value = "/hello",method = RequestMethod.GET)
    public String home(@RequestParam String name){
//        ServiceInstance instance=client.getLocalServiceInstance();
//        logger.info("serviceId"+instance.getServiceId()+"host:post="+instance.getHost()+":"+instance.getPort());
        return name + " hello spring";
    }
    @RequestMapping(value = "/hello1",method = RequestMethod.GET)
    public String home1(@RequestParam String name){
//        ServiceInstance instance=client.getLocalServiceInstance();
//        logger.info("serviceId"+instance.getServiceId()+"host:post="+instance.getHost()+":"+instance.getPort());
        return name + " hello spring";
    }
}