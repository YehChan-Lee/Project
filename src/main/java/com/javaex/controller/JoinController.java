package com.javaex.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.AllDao;
import com.javaex.model.ReviewDao;
import com.javaex.model.ReservationDao;
import com.javaex.model.ShopDao;
import com.javaex.model.ShopUserDao;
import com.javaex.model.ShopUserVo;
import com.javaex.model.VisitDao;

@Controller
public class JoinController {
	
	@Autowired
	ShopDao dao;

	@Autowired
	ShopUserDao userDao;
	
	@Autowired
	ReservationDao reservedao;
	
	@Autowired
	AllDao alldao;
	
	@Autowired
	ReviewDao reviewdao;
	
	@Autowired
	private VisitDao visitDao;

	// 메인페이지 실시간 리뷰 리스트 Get
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mav, String v) {
		System.out.println("/BabPool/main");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String custIP = req.getRemoteAddr();
		
		visitDao.reVisi(custIP);
		/*System.out.println(visitDao.reVisi(custIP));
		System.out.println(visitDao.reVisi(custIP).size());*/
		if(visitDao.reVisi(custIP).size() == 0) {
			visitDao.insertVisit(custIP);			
		} else {
			System.out.println("IP 중복 >> " + custIP + "("+visitDao.reVisi(custIP).size()+")");
		}
		mav.addObject("reviewList", alldao.getReview());
		mav.setViewName("main");
		return mav;
	}

	// 마이페이지
	@RequestMapping("/mypage")
	public ModelAndView mypage(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage");
		// 아이디 가져오기
		String user_email = (String) session.getAttribute("sessionID");
		ShopUserVo user = userDao.loginCheck(user_email);
		session.setAttribute("user_photo", user.getUser_photo());
		mav.addObject("reserveList", alldao.reserveList(user_email));
		mav.addObject("reviewList", alldao.reviewList(user_email));
		mav.addObject("dibsList", alldao.dibsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage");
		return mav;
	}

	@RequestMapping("/mypage/reservation")
	public ModelAndView mypage_reservation(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/reservation");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reserveList", alldao.reserveList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());

		mav.setViewName("mypage/mypage_reservation");
		return mav;
	}

	@RequestMapping("/mypage/reservation2")
	public ModelAndView mypage_reservation2(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/reservation2");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reserveList", alldao.reserveList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());

		mav.setViewName("mypage/mypage_reservation2");
		return mav;
	}
	
	@RequestMapping("/mypage/reservation3")
	public ModelAndView mypage_reservation3(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/reservation3");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("pastList", alldao.pastList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_reservation3");
		return mav;
	}
	
	@RequestMapping("/mypage/review")
	public ModelAndView mypage_review(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/review");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reviewList", alldao.reviewList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_review");
		return mav;
	}

	@RequestMapping("/mypage/review2")
	public ModelAndView mypage_review2(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/review2");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reviewList", alldao.reviewList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_review2");
		return mav;
	}
	
	@RequestMapping("/mypage/review3")
	public ModelAndView mypage_review3(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/review3");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reviewList", alldao.reviewList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_review3");
		return mav;
	}
	
	@RequestMapping("/mypage/dibs")
	public ModelAndView mypage_dibs(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/dibs");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("dibsList", alldao.dibsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_dibs");
		return mav;
	}
	
	@RequestMapping("/mypage/notice")
	public ModelAndView mypage_notice(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/notice");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("newsList", alldao.newsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage_notice");
		return mav;
	}
	
	@RequestMapping("/mypage/notice2")
	public ModelAndView mypage_notice2(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/notice");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("newsList", alldao.newsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage_notice2");
		return mav;
	}
	
	@RequestMapping("/mypage/notice3")
	public ModelAndView mypage_notice3(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/notice3");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("bpList", alldao.bpList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage_notice3");
		return mav;
	}
	// 마이페이지 설정
	@RequestMapping("/mypage/setting")
	public ModelAndView mypage_setting(ModelAndView mav, HttpSession session, HttpServletRequest req) {
		System.out.println("/BabPool/mypage/setting");
		String user_email = (String)session.getAttribute("sessionID");
		
		mav.addObject(user_email);
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage_setting");
		return mav;
	}
	
	@RequestMapping("/mypage/setting.do")
	public void my_setting(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("/BabPool/mypage/setting.do");
		String user_email = (String)session.getAttribute("sessionID");
		String user_name = req.getParameter("update_name");			
		String user_phone = req.getParameter("update_phone");			
		System.out.println("기본=>user_email: "+user_email+", update_phone : " +user_phone + ", update_name :" + user_name);
		
		if(!user_name.equals("")) { // 이름만 변경
			userDao.Update_shopuser(user_name, user_email);
			System.out.println("이름만=>user_email: "+user_email+", update_phone : " +user_phone + ", update_name :" + user_name);
		} else if(!user_phone.equals("")) { // 번호만 변경
			userDao.Update_phone(user_phone, user_email);;
			System.out.println("번호만=>user_email: "+user_email+", update_phone : " +user_phone + ", update_name :" + user_name);
		} else if(user_phone.equals("") && user_name.equals("")) {
			resp.getWriter().write("fail");
			return;
		}
		resp.getWriter().write("update_success");
	}
	
	@RequestMapping("mypage/profile.do")
	public void mypage_profile(MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		System.out.println("/BabPool/mypage/profile.do");
		String user_email = (String) session.getAttribute("sessionID");
		String url = "D:\\Git\\Project\\Project\\webapp\\serverImg\\";
		
		String folder = "profile\\user\\";
		String fileName = "profile"+user_email+".png";
		MultipartFile mf = req.getFile("photofile");
		String safeFile = url + folder + fileName;
		try {
			File file = new File(url+folder);
			if (!file.exists()) {
				try {
					file.mkdir(); // 폴더 생성합니다.
					System.out.println("폴더가 생성되었습니다.");
					mf.transferTo(new File(safeFile));
				} catch (Exception e) {
					e.getStackTrace();
				}
			} else {
				mf.transferTo(new File(safeFile));
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		userDao.profileUpdate(fileName,user_email);
		res.getWriter().write("update_success");
	}
	
	// footer
	@RequestMapping("/footer")
	public ModelAndView footer(ModelAndView mav) {
		System.out.println("/BabPool/footer_user");		
		mav.addObject("footeruser", alldao.footeruser());
		mav.addObject("footerreview", reviewdao.footerreview());
		mav.addObject("footerreserve", reservedao.footerreserve());
		mav.setViewName("footer");
		return mav;
	}
	
	@RequestMapping("/detail/review.do")
	public ModelAndView hello(ModelAndView mav,HttpSession session,HttpServletRequest req) {
		System.out.println("/BabPool/review.do");
		String shopId = req.getParameter("shopId");
		String user_email = (String)session.getAttribute("sessionID");
		System.out.println("review : " + shopId + user_email);
		mav.addObject("reviewList",alldao.shopreviewList(shopId));
		if(user_email != null) {
			mav.addObject("likeList",reviewdao.likeList(user_email,shopId));
			mav.addObject("hateList",reviewdao.hateList(user_email,shopId));
		}
		mav.addObject("shopId",shopId);
		mav.setViewName("detail/detail_review");
		return mav;
	}
	
}
