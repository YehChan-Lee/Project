package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.AdminDao;
import com.javaex.model.AllDao;
import com.javaex.model.ShopDao;

@Controller
public class AdminController {
	
	@Autowired
	ShopDao dao;

	@Autowired
	AdminDao admindao;
	
	@Autowired
	AllDao alldao;
	
	@RequestMapping("/admin")
	public ModelAndView admin(ModelAndView mav) {
		System.out.println("/BabPool/admin");

		mav.addObject("Areview_list", admindao.Areview_list());
		mav.setViewName("admin/admin");
		return mav;
	}
	
	@RequestMapping("/admin/admin_member")
	public ModelAndView admin_member(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_member");

		mav.addObject("Amember_list", admindao.Amember_list());
		mav.setViewName("admin/admin_member");
		return mav;
	}
	
}
