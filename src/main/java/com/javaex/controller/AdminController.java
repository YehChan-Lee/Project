package com.javaex.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
import com.javaex.model.VisitDayVo;
import com.javaex.model.VisitVo;

@Controller
public class AdminController {

	String coun="01";

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

	@RequestMapping(value = "/admin/admin_company2")
	public ModelAndView admin_company2(ModelAndView mav, HttpServletRequest req) {
		System.out.println("/BabPool/admin/admin_company2");

		String shId1 = (String) req.getParameter("info1");
		String shId2 = (String) req.getParameter("info2");

		if (shId1 == null && shId2 == null) {
			mav.addObject("Acompany2_list", admindao.Acompany2_list());
			mav.setViewName("admin/admin_company2");
			return mav;
		}

		if (shId1 != null && shId2 == null) {
			ShopVo vo = new ShopVo();
			vo.setShop_id(shId1);
			admindao.admin_AcomState1(vo);
		}

		if (shId1 == null && shId2 != null) {
			ShopVo vo = new ShopVo();
			vo.setShop_id(shId2);
			admindao.admin_AcomState2(vo);
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
	public ModelAndView admin_numerical1(ModelAndView mav, HttpServletRequest req) {
		System.out.println("/BabPool/admin/admin_numerical1");

		Date d = new Date();
		SimpleDateFormat todayFo = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat monthFo = new SimpleDateFormat("MM");
		String today = todayFo.format(d);
		String month = monthFo.format(d);
		ArrayList<Object> da = new ArrayList<>();

		String[] cnt = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16",
				"17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };

		for (int r = 0; r < 31; r++) {
			for (int v = 0; v < visitDao.aDAy(month).size(); v++) {
				try {
					if ((month + "/" + cnt[r]).equals(visitDao.aDAy(month).get(v).getDay())) {
						da.add(visitDao.aDAy(month).get(v).getCount());
					}
				} catch (Exception e) {
				}
			}
			if (da.size() == r) {
				da.add(0);
			}
			// 초기화면 데이터 삽입 현재 월넣기
		}

		mav.addObject("admin_numerical1_day", da);
		mav.addObject("admin_numerical_total_totalToday", visitDao.aTotalToday(today));
		mav.addObject("admin_numerical_total_totalMonth", visitDao.aTotalMonth());
		mav.addObject("admin_numerical_total_total", visitDao.aTotalAll());
		mav.setViewName("admin/admin_numerical1");
		return mav;
	}

	@RequestMapping("/admin/admin_numerical1_chart")
	public ModelAndView admin_numerical1_chart(ModelAndView mav, HttpServletRequest req,
			@RequestParam(required = false, defaultValue = "info") String info) {
		System.out.println("/BabPool/admin/admin_numerical1_chart");
		
		System.out.println(">>>i"+info);
		Date d = new Date();
		SimpleDateFormat monthFo = new SimpleDateFormat("MM");
		String month = monthFo.format(d);
		ArrayList<Object> da = new ArrayList<>();

		String[] cnt1 = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
				"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };
		
		if(info.equals("info")) {
			for (int o = 0; o < 31; o++) {
				for (int p = 0; p < visitDao.aDAy(month).size(); p++) {
					try {
						if ((month + "/" + cnt1[o]).equals(visitDao.aDAy(month).get(p).getDay())) {
							da.add(visitDao.aDAy(month).get(p).getCount());
						}
					} catch (Exception e) {
					}
				}
				if (da.size() == o) {
					da.add(0);
				}
			}
		
			mav.addObject("admin_numerical1_day", da);
			mav.setViewName("admin/admin_numerical1_chart");
			return mav;
		} 
		
			for (int i = 0; i < 31; i++) {
				for (int p = 0; p < visitDao.aDAy(info).size(); p++) {
					try {
						if ((info + "/" + cnt1[i]).equals(visitDao.aDAy(info).get(p).getDay())) {
							da.add(visitDao.aDAy(info).get(p).getCount());
						}
					} catch (Exception e) {
					}
				}
				if (da.size() == i) {
					da.add(0);
				}
			}
		
		for (int m = 0; m < da.size(); m++) {
			System.out.println(da.get(m));
		}
		mav.addObject("admin_numerical1_day", da);
		mav.setViewName("admin/admin_numerical1_chart");
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

		String cnt1 = visitDao.aMonth("01");
		String cnt2 = visitDao.aMonth("02");
		String cnt3 = visitDao.aMonth("03");
		String cnt4 = visitDao.aMonth("04");
		String cnt5 = visitDao.aMonth("05");
		String cnt6 = visitDao.aMonth("06");
		String cnt7 = visitDao.aMonth("07");
		String cnt8 = visitDao.aMonth("08");
		String cnt9 = visitDao.aMonth("09");
		String cnt10 = visitDao.aMonth("10");
		String cnt11 = visitDao.aMonth("11");
		String cnt12 = visitDao.aMonth("12");
		// null >> 0 으로 변환 오류 제거용
		if (cnt1 == null) {
			cnt1 = "0";
		}
		if (cnt2 == null) {
			cnt2 = "0";
		}
		if (cnt3 == null) {
			cnt3 = "0";
		}
		if (cnt4 == null) {
			cnt4 = "0";
		}
		if (cnt5 == null) {
			cnt5 = "0";
		}
		if (cnt6 == null) {
			cnt6 = "0";
		}
		if (cnt7 == null) {
			cnt7 = "0";
		}
		if (cnt8 == null) {
			cnt8 = "0";
		}
		if (cnt9 == null) {
			cnt9 = "0";
		}
		if (cnt10 == null) {
			cnt10 = "0";
		}
		if (cnt11 == null) {
			cnt11 = "0";
		}
		if (cnt12 == null) {
			cnt12 = "0";
		}
		ArrayList<String> list = new ArrayList<String>();
		list.add(cnt1);
		list.add(cnt2);
		list.add(cnt3);
		list.add(cnt4);
		list.add(cnt5);
		list.add(cnt6);
		list.add(cnt7);
		list.add(cnt8);
		list.add(cnt9);
		list.add(cnt10);
		list.add(cnt11);
		list.add(cnt12);

		mav.addObject("admin_aMonth", list);

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
