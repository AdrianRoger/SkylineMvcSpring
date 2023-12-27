package com.SkylineMvcSpring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
	
	
	  @GetMapping("/destino")
	  public String showDestinoPage() {
	    return "destino";
	  }
	  
	  @GetMapping("/promocoes")
	  public String showPromocoesPage() {
	    return "promocoes";
	  }
	  
	  @GetMapping("/contato")
	  public String showContatoPage() {
	    return "contato";
	  }
}
