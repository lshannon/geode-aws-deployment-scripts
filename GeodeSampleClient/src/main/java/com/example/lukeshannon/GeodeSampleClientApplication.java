package com.example.lukeshannon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource("classpath:client-cache.xml")
public class GeodeSampleClientApplication {

	public static void main(String[] args) {
		SpringApplication.run(GeodeSampleClientApplication.class, args);
	}
}
