package com.example.springboot1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class Springboot1 {

    public static void main(String[] args) {
        SpringApplication.run(Springboot1.class, args);
    }

    @RestController
    public static class HelloWorldController {

        @GetMapping("/")
        public String helloWorld() {
            return "Hello World";
        }
    }
}
