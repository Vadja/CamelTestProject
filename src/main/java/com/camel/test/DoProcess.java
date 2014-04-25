package com.camel.test;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.spring.Main;

/**
 * Created by Vadzim on 24.04.2014.
 */
public class DoProcess implements Processor {
    @Override
    public void process(Exchange exchange) throws Exception {
        String text = exchange.getIn().getBody(String.class);
        System.out.println(text);
        System.out.println("--------------------------------------");
    }
}