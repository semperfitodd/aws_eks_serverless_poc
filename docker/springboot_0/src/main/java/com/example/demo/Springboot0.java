package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

@SpringBootApplication
public class Springboot0 {

    public static void main(String[] args) {
        SpringApplication.run(Springboot0.class, args);
    }

    @RestController
    public static class HelloController {

        @Autowired
        private RestTemplate restTemplate;

        @GetMapping("/")
        public String sayHello() {
            ResponseEntity<String> responseEntity = restTemplate.getForEntity("http://springboot-1/", String.class);
            return responseEntity.getBody();
        }

    }

    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        return builder.build();
    }

}
