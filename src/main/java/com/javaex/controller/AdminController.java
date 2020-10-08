package com.javaex.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.AdminDao;
import com.javaex.model.AdminVo;
import com.javaex.model.AllDao;
import com.javaex.model.NoticeVo;
import com.javaex.model.ShopDao;
import com.javaex.model.ShopVo;
import com.javaex.model.VisitDao;
import com.javaex.model.VisitVo;

@Controller
public class AdminController {

	@Autowired
	ShopDao dao;

	@Autowired
	AdminDao admindao;

	@Autowired
	AllDao alldao;

	@Autowired
	VisitDao visitDao;

	@RequestMapping("/admin")
	public ModelAndView admin(ModelAndView mav, @RequestParam(required = false, defaultValue = "null") String pSea,
			@RequestParam(required = false, defaultValue = "null") String pSea_txt) {
		System.out.println("/BabPool/admin");

		Date d = new Date();
		SimpleDateFormat todayFo = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat monthFo = new SimpleDateFormat("MM");

		String today = todayFo.format(d);
		String month = monthFo.format(d);
		System.out.println("현재(yy/mm/dd) : " + today);

		mav.addObject("admin_numerical_totalToday", visitDao.aTotalToday(today));
		mav.addObject("admin_numerical_totalMonth", visitDao.aTotalMonth());
		mav.addObject("adminHomeM", visitDao.aHomeMonth(month));

		mav.addObject("admin_appli_size", admindao.admin_appli());
		mav.addObject("admin_numerical_total", visitDao.aTotalAll());
		mav.addObject("Aadmin_id", admindao.Aadmin_id());
		mav.addObject("Areview_list", admindao.Areview_list(pSea, pSea_txt));
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

	@RequestMapping(value="/admin/admin_company2")
	public ModelAndView admin_company2(ModelAndView mav, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "null") String info) {
		System.out.println("/BabPool/admin/admin_company2");
		
		String shId = (String)req.getParameter("info");
		System.out.println(shId);
		
		if (shId == null){
			mav.addObject("Acompany2_list", admindao.Acompany2_list());
			mav.setViewName("admin/admin_company2");
			return mav;
		}
		
		if(!shId.equals("null") || shId != null) {
			ShopVo vo = new ShopVo();
			vo.setShop_id(shId);
			admindao.admin_AcomState1(vo);
		} 
		
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
	public ModelAndView admin_resSitu_info(HttpServletRequest req, ModelAndView mav)
			throws UnsupportedEncodingException {
		System.out.println("/BabPool/admin/admin_resSitu_info");

		String idx = (String) req.getParameter("idx");
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
	public ModelAndView admin_numerical1(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_numerical1");
		Date d = new Date();
		SimpleDateFormat todayFo = new SimpleDateFormat("yy/MM/dd");
		String today = todayFo.format(d);
		mav.addObject("admin_numerical_total_totalToday", visitDao.aTotalToday(today));
		mav.addObject("admin_numerical_total_totalMonth", visitDao.aTotalMonth());
		mav.addObject("admin_numerical_total_total", visitDao.aTotalAll());
		mav.setViewName("admin/admin_numerical1");
		return mav;
	}

	@RequestMapping("/admin/admin_numerical2")
	public ModelAndView admin_numerical2(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_numerical2");
		Date d = new Date();
		SimpleDateFormat todayFo = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat weekFo = new SimpleDateFormat("MM");
		String today = todayFo.format(d);
		String week = weekFo.format(d);

		System.out.println(">>>" + week);
		System.out.println(">>>" + visitDao.aWeek(week));
		/* mav.addObject("admin_numerical2_week", visitDao.aWeek(week)); */
		mav.addObject("admin_numerical_total_totalToday", visitDao.aTotalToday(today));
		mav.addObject("admin_numerical_total_totalMonth", visitDao.aTotalMonth());
		mav.addObject("admin_numerical_total_total", visitDao.aTotalAll());
		mav.setViewName("admin/admin_numerical2");
		return mav;
	}

	@RequestMapping("/admin/admin_numerical3")
	public ModelAndView admin_numerical3(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_numerical3");
		Date d = new Date();
		SimpleDateFormat todayFo = new SimpleDateFormat("yy/MM/dd");
		String today = todayFo.format(d);
		mav.addObject("admin_numerical_total_totalToday", visitDao.aTotalToday(today));
		mav.addObject("admin_numerical_total_totalMonth", visitDao.aTotalMonth());
		mav.addObject("admin_numerical_total_total", visitDao.aTotalAll());
		mav.setViewName("/admin/admin_numerical3");
		return mav;
	}

	@RequestMapping("/admin/admin_notice")
	public ModelAndView admin_notice(ModelAndView mav) {
		System.out.println("/BabPool/admin/admin_notice");

		mav.addObject("Anotice_list", admindao.Anotice_list());
		mav.setViewName("admin/admin_notice");
		return mav;
	}

	@RequestMapping("/admin_notice_info")
	public ModelAndView admin_notice_info(HttpServletRequest req, ModelAndView mav,
			@RequestParam(required = false, defaultValue = "null") String del,
			@RequestParam(required = false, defaultValue = "0") int idx) throws UnsupportedEncodingException {
		System.out.println("/BabPool/admin/admin_notice_info");
		if (idx != 0) {
			if (del.equals("null") || del.equals(null)) {
				mav.addObject("Anotice_list_info", admindao.Anotice_list_info(idx));
				mav.setViewName("admin/admin_notice_info");
				return mav;
			} else if (del.equals("true") || del.equals(true)) {
				admindao.admin_notice_del(idx);
			} else {
				mav.addObject("Anotice_list", admindao.Anotice_list());
				mav.setViewName("admin/admin_notice");
				return mav;
			}
		}
		mav.addObject("Anotice_list", admindao.Anotice_list());
		mav.setViewName("admin/admin_notice");
		return mav;
	}

	@RequestMapping("/admin_notice_modify")
	public ModelAndView Anotice_list_modify(HttpServletRequest req, ModelAndView mav,
			@RequestParam(required = false, defaultValue = "null") String title,
			@RequestParam(required = false, defaultValue = "null") String texarea) throws UnsupportedEncodingException {
		System.out.println("/BabPool/admin/admin_notice_info");
		
		String idx = (String) req.getParameter("idx");
		int numIdx = Integer.parseInt(idx);

		if (!title.equals("null") || !texarea.equals("null")) {
			NoticeVo vo = new NoticeVo();
			vo.setNotice_idx(numIdx);
			vo.setNotice_title(title);
			vo.setNotice_content(texarea);
			admindao.admin_notice_modi(vo);
		}

		mav.addObject("Anotice_list_modify", admindao.Anotice_list_modify(numIdx));
		mav.setViewName("admin/admin_notice_modify");
		return mav;
	}

}
