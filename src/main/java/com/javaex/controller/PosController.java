package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.PosDao;

@Controller
public class PosController {
	
	@Autowired
	PosDao posdao;
	
	@RequestMapping("/pos")
	public ModelAndView startPos(ModelAndView mav) {
		String shopId = "123-12-12345";
		mav.addObject("Menu",posdao.getMenu(shopId));
		mav.addObject("reserveList",posdao.getReserveList(shopId));
		mav.setViewName("pos/pos");
		return mav;
	}
}
