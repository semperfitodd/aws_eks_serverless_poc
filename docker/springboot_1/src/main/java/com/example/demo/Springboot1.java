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
            new Thread(() -> generateCpuLoad(10000)).start();
            return "Hello from springboot_1 deployment";
        }

        private void generateCpuLoad(long durationMillis) {
            long startTime = System.currentTimeMillis();
            while (System.currentTimeMillis() - startTime < durationMillis) {
                fibonacci(40);
            }
        }

        private long fibonacci(long n) {
            if (n <= 1) {
                return n;
            }
            return fibonacci(n - 1) + fibonacci(n - 2);
        }
    }
}
