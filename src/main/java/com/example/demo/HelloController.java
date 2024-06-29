package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class HelloController {
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello World!";
    }

    @GetMapping("/second-app")
    public String secondAppSayHello() {
        final String uri = "http://localhost:60464/hello";
        final String url = "http://service-1st-app.1st-app-namespace.svc.cluster.local/hello";
        RestTemplate restTemplate = new RestTemplate();
        String firstAppResponse = restTemplate.getForObject(url, String.class);
        return firstAppResponse + "That is the greeting from 1st app. And I'm the 2nd app!";
    }
}
