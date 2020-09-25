package com.javaex.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/admin/admin_company")
	public ModelAndView admin_company(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_company");

		mav.addObject("Acompany_list", admindao.Acompany_list());
		mav.setViewName("admin/admin_company");
		return mav;
	}
	
	@RequestMapping("/admin/admin_company2")
	public ModelAndView admin_company2(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_company2");

		mav.addObject("Acompany2_list", admindao.Acompany2_list());
		mav.setViewName("admin/admin_company2");
		return mav;
	}
	
	@RequestMapping("/admin/admin_resSitu")
	public ModelAndView admin_resSitu(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_resSitu");

		mav.addObject("AresSitu_list", admindao.AresSitu_list());
		mav.setViewName("admin/admin_resSitu");
		return mav;
	}
	
	@RequestMapping("/admin_resSitu_info")
	public ModelAndView admin_resSitu_info(HttpServletRequest req, ModelAndView mav) throws UnsupportedEncodingException {
		System.out.println("/BabPool/admin/admin_resSitu_info");
		
		String idx = (String)req.getParameter("idx");
		int numIdx = Integer.parseInt(idx);
	
		mav.addObject("AresSitu_info", admindao.AresSitu_info(numIdx));
		mav.setViewName("admin/admin_resSitu_info");
		return mav;
	}
	
//	@RequestMapping("/admin/admin_company2")
//	public String admin_company2() {
//		System.out.println("/hellospring/admin/admin_company2");
//		return "admin/admin_company2";
//	}
//	@RequestMapping("/admin/admin_resSitu")
//	public String admin_resSitu() {
//		System.out.println("/hellospring/admin/admin_resSitu");
//		return "admin/admin_resSitu";
//	}
//	@RequestMapping("/admin/admin_resRegi")
//	public String admin_resRegi() {
//		System.out.println("/hellospring/admin/admin_resRegi");
//		return "admin/admin_resRegi";
//	}
	@RequestMapping("/admin/admin_numerical1")
	public String admin_numerical1() {
		System.out.println("/BabPool/admin/admin_numerical1");
		return "admin/admin_numerical1";
	}
	@RequestMapping("/admin/admin_numerical2")
	public String admin_numerical2() {
		System.out.println("/BabPool/admin/admin_numerical2");
		return "admin/admin_numerical2";
	}
	@RequestMapping("/admin/admin_numerical3")
	public String admin_numerical3() {
		System.out.println("/BabPool/admin/admin_numerical3");
		return "admin/admin_numerical3";
	}
//	@RequestMapping("/admin/admin_numerical4")
//	public String admin_numerical4() {
//		System.out.println("/hellospring/admin/admin_numerical4");
//		return "admin/admin_numerical4";
//	}
//	@RequestMapping("/admin/admin_numerical5")
//	public String admin_numerical5() {
//		System.out.println("/hellospring/admin/admin_numerical5");
//		return "admin/admin_numerical5";
//	}
//	@RequestMapping("/admin/admin_numerical6")
//	public String admin_numerical6() {
//		System.out.println("/hellospring/admin/admin_numerical6");
//		return "admin/admin_numerical6";
//	}
//	@RequestMapping("/admin/admin_numerical7")
//	public String admin_numerical7() {
//		System.out.println("/hellospring/admin/admin_numerical7");
//		return "admin/admin_numerical7";
//	}
	@RequestMapping("/admin/admin_notice")
	public ModelAndView admin_notice(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_notice");
		
		mav.addObject("Anotice_list", admindao.Anotice_list());
		mav.setViewName("admin/admin_notice");
		return mav;
	}
	
	@RequestMapping("/admin_notice_info")
	public ModelAndView admin_notice_info(HttpServletRequest req, ModelAndView mav) throws UnsupportedEncodingException {
		System.out.println("/BabPool/admin/admin_notice_info");
		
		String idx = (String)req.getParameter("idx");
		int numIdx = Integer.parseInt(idx);
	
		mav.addObject("Anotice_list_info", admindao.Anotice_list_info(numIdx));
		mav.setViewName("admin/admin_notice_info");
		return mav;
	}
	
	@RequestMapping("/admin_notice_modify")
	public String admin_notice_modify() {
		System.out.println("/BabPool/admin/admin_notice_modify");
		return "admin/admin_notice_modify";
	}
}
