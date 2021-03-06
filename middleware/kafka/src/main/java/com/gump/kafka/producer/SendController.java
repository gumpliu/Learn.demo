package com.gump.kafka.producer;

import com.gump.kafka.consumer.Consumer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: Xiaour
 * @Description:
 * @Date: 2018/5/22 15:13
 */
@RestController
@RequestMapping("/kafka")
public class SendController {

    @Autowired
    private Producer producer;

    @Autowired
    private Consumer consumer;

    @RequestMapping(value = "/send")
    public String send() {
        producer.send();
        return "{\"code\":0}";
    }

    @RequestMapping(value = "/get")
    public String get() {
        producer.send();
        return "{\"code\":0}";
    }
}