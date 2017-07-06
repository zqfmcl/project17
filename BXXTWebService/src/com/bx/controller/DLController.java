package com.bx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DLController {

	@RequestMapping(value="/Location")
	public String findLocation(){
		
		
		return "";
	}
	
}
