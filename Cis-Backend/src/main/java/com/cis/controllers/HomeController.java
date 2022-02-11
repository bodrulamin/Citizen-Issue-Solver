package com.cis.controllers;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(value = "http://localhost:4200", maxAge = 3600)
public class HomeController {
	
	@GetMapping("/")
	public String sigup() {
		

		return "hello world";
		
	}
	


}
