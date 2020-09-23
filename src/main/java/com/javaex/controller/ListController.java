package com.javaex.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.ognl.ParseException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.Criteria;
import com.javaex.model.NoticeDao;
import com.javaex.model.PageMaker;
import com.javaex.model.ReservationDao;
import com.javaex.model.ReservationVo;
import com.javaex.model.ReviewDao;
import com.javaex.model.ReviewVo;
import com.javaex.model.ShopDao;
import com.javaex.model.ShopUserDao;
import com.javaex.model.ShopUserVo;
import com.javaex.model.ShopVo;

@Controller
public class ListController {

	@Autowired
	ShopDao dao;

	@Autowired
	ShopUserDao userDao;
	
	@Autowired
	NoticeDao noticedao;
	
	@Autowired
	ReviewDao reviewdao;
	

	@Autowired
	ReservationDao resDao;
	
	String url = "D:\\LYC\\SpringGit\\Project\\webapp\\serverImg\\";
	
	@RequestMapping("/review_upload")
	public void test(ModelAndView mav, MultipartHttpServletRequest req, HttpServletResponse res,HttpSession session) throws IOException {
		System.out.println("/BabPool/review_upload");
		List<MultipartFile> fileList = req.getFiles("inputImage");// input file타입 파라미터
		
		double reviewScore = Double.parseDouble(req.getParameter("hidden_grade"));// 별점
		String review = req.getParameter("review_area");// 리뷰내용
		String shopId = req.getParameter("shopId");
		req.setAttribute("shopId", shopId);
		System.out.println("shopidx"+req.getParameter("shopidx") +"\n" + "shopId" + req.getParameter("shopId"));
		String folder = "review\\";// 이미지 저장 경로
		String user_email = (String) session.getAttribute("sessionID");
		String path="";
		String fileName = "";
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			fileName = "review"+reviewdao.reviewCnt(shopId) + shopId + originFileName;
			String safeFile = url + folder + fileName;
			try {
				File file = new File(url);
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
			path+=fileName+"/";
		}
		System.out.println(path);
		reviewdao.reviewUpload(new ReviewVo(0,shopId, user_email, reviewScore, review,path, 0, 0));
		res.getWriter().write("success");
		System.out.println("별점의 tmp : " + reviewScore + "\n" + "textarea : " + review);
	}

	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mav, HttpServletRequest request, Criteria cri) {
		System.out.println("/BabPool/list");
		mav.addObject("shoplist",dao.shopSearch(request.getParameter("location"), request.getParameterValues("shop_addr"),
                request.getParameterValues("food_type"), request.getParameter("string_search"),
                request.getParameter("solt"), request.getParameter("price_list"),
                request.getParameterValues("add_info"), request.getParameterValues("table_type"),
                request.getParameterValues("alcohol_type"), request.getParameter("parking_available")));
		mav.addObject("pageList", dao.pageList(cri));
		
		PageMaker pageMakerlist = new PageMaker();
		pageMakerlist.setCri(cri);
		pageMakerlist.setTotalCount(noticedao.pageCount());
		
		mav.addObject("pageMakerlist", pageMakerlist);
		mav.setViewName("list");
		return mav;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mav, HttpServletRequest request, HttpSession session) {
		System.out.println("/BabPool/detail");
		String user_email = (String)session.getAttribute("sessionID");
		String shop_idx = request.getParameter("shopidx");
			if(user_email != null){
				userDao.update_recentShop_shopIdx(user_email, shop_idx);
				ShopUserVo user;
				user = userDao.loginCheck(user_email);
				if(user.getRecent_shop() != null){
					ShopVo recent_shopList = dao.getAll_shopIdx(user.getRecent_shop());
					session.setAttribute("shop_title", recent_shopList.getShop_title());
					session.setAttribute("food_type", recent_shopList.getFood_type());
					session.setAttribute("shop_addr", recent_shopList.getShop_addr());
					session.setAttribute("shop_idx", recent_shopList.getShop_idx());
				}
			}
		int shopId = Integer.parseInt(shop_idx);
		mav.addObject("shopOne", dao.shopOne(shopId));
		int shopIdx = Integer.parseInt(request.getParameter("shopidx"));
		mav.addObject("shopOne", dao.shopOne(shopIdx));
		mav.setViewName("detail/detail");
		return mav;
	}

	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("/BabPool/login");

		String user_email = request.getParameter("user_id");
		String password = request.getParameter("user_pw");

		ShopUserVo user;
		if (userDao.loginCheck(user_email) != null) {
			user = userDao.loginCheck(user_email);
			if(user.getUser_pw().equals(password)) {
				response.getWriter().write("success");
				session.setAttribute("is_owner", user.getIs_owner());
				session.setAttribute("sessionID", user_email);
				if(user.getRecent_shop() != null){
					ShopVo recent_shopList = dao.getAll_shopIdx(user.getRecent_shop());
					session.setAttribute("shop_title", recent_shopList.getShop_title());
					session.setAttribute("food_type", recent_shopList.getFood_type());
					session.setAttribute("shop_addr", recent_shopList.getShop_addr());
					session.setAttribute("shop_idx", recent_shopList.getShop_idx());
				}
				
				if (user.getIs_owner().equals("1")) {
					session.setAttribute("shop_id", dao.getShopId(user_email));
				}
			} else {
				response.getWriter().write("fail");
			}			
		}else if(user_email.equals("admin")) {
			response.getWriter().write("admin");
		}else {
			System.out.println("ID가 존재하지않음");
			response.getWriter().write("fail");
		}
	}

	@RequestMapping("/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/logout");
		session.invalidate();
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/join")
	public ModelAndView signup(ModelAndView mav,HttpServletRequest req) {
		System.out.println("/BabPool/signup");
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String birth = req.getParameter("bir_year")+"-"+req.getParameter("bir_mon")+"-" + req.getParameter("bir_day");
		String gender = req.getParameter("gender");
		String phone = req.getParameter("phone");
		int joinType = Integer.parseInt(req.getParameter("join_type"));
		
		if (joinType == 1) {
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "0", null, 0, null, 0));
		} else {
			String buisnessNumber = req.getParameter("buisness_number");
			String buisnessName = req.getParameter("buisness_name");
			String buisnessAddress = req.getParameter("buisness_address");
			String buisnessAddressEtc = req.getParameter("buisness_address_etc");
			String buisnessFoodType = req.getParameter("buisness_food_type");		

			System.out.println(buisnessNumber + " " + buisnessName + " " + buisnessAddress + " " + buisnessAddressEtc
					+ " " + buisnessFoodType);
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "1", null, 0, null, 0));
		}
		mav.setViewName("main");
		return mav;
	}

	@RequestMapping("/notice")
	public ModelAndView pageList(ModelAndView mav, Criteria cri) {
		System.out.println("/BabPool/notice");
		mav.addObject("pageList", noticedao.pageList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticedao.pageCount());
		
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("notice");
		return mav;
	}
	
	@RequestMapping("/detail/info.do")
	public ModelAndView detail_info(ModelAndView mav,HttpServletRequest request) {
		System.out.println("/BabPool/detail_info");
		int shop_idx = Integer.parseInt(request.getParameter("shopidx"));
		mav.addObject("shopOne",dao.shopOne(shop_idx));
		mav.setViewName("detail/detail_info");
		return mav;
	}
	
//	@RequestMapping("/detail2/photo.do")
//	public ModelAndView detail_photo(ModelAndView mav,HttpServletRequest request) {
//		System.out.println("/BabPool/detail_photo");
//		int shop_idx = Integer.parseInt(request.getParameter("shopidx"));
//		mav.addObject("shopOne",shopdao.shopOne(shop_idx));
//		mav.setViewName("detail_photo");
//		return mav;
//	}
	
	@RequestMapping("/buisness_update")
	public ModelAndView buisnessmypage_update(ModelAndView mav ,HttpServletRequest req) {
		String shop_title = req.getParameter("shop_title");
		String shop_addr = req.getParameter("shop_addr");
		String shop_location = req.getParameter("shop_location");
		String shop_id = req.getParameter("shop_id");
		String food_type = req.getParameter("food_type");
		String budget = req.getParameter("budget");
		String shop_tip = req.getParameter("shop_tip");
		String shop_comment = req.getParameter("shop_comment");
		String shop_phone = req.getParameter("shop_phone");
		String[] shop_time = req.getParameterValues("shop_time");
		String[] shop_addinfoArr = req.getParameterValues("shop_addinfo");
		String shop_addinfo = "";
		String[] shop_tbArr = req.getParameterValues("shop_tb");
		String shop_tb = "";
		String[] shop_alcoholArr = req.getParameterValues("shop_alcohol");
		String shop_alcohol = "";
		String shop_car = req.getParameter("shop_car");
		String shop_close = req.getParameter("shop_close");
		String shop_photo = null;
		String comma = "";

		for (int i = 0; i < shop_alcoholArr.length; i++) {
			if (i == 0) {
				shop_alcohol += comma + shop_alcoholArr[i];
				comma = ",";
			} else {
				shop_alcohol += comma + shop_alcoholArr[i];
			}

		}

		for (int i = 0; i < shop_tbArr.length; i++) {
			if (i == 0) {
				comma = "";
				shop_tb += comma + shop_tbArr[i];
				comma = ",";
			} else {
				shop_tb += comma + shop_tbArr[i];
			}
		}

		for (int i = 0; i < shop_addinfoArr.length; i++) {
			if (i == 0) {
				comma = "";
				shop_addinfo += comma + shop_addinfoArr[i];
				comma = ",";
			} else {
				shop_addinfo += comma + shop_addinfoArr[i];
			}
		}
		ShopVo s = new ShopVo(shop_title, shop_id, shop_addr, shop_location, food_type, shop_tip, budget, shop_comment,
				shop_phone, shop_time, shop_addinfo, shop_tb, shop_alcohol, shop_car, shop_close, shop_photo);
		dao.updateShop(s);
		mav.setViewName("buisnessmypage");
		System.out.println(s.toString());
		return mav;
	}
	
	@RequestMapping("/buisnessmypage/registration2")
	public ModelAndView registration2(ModelAndView mav, HttpSession session) {
		
		mav.addObject("shopOwnerList", dao.shopOwnerList((String)session.getAttribute("sessionID")));
		mav.setViewName("buisnessmypage/buisness_mypage_registration2");
		return mav;
	}
	@RequestMapping("/review/like")
	public void reviewLike(HttpSession session,HttpServletResponse res,HttpServletRequest req) throws IOException {
		System.out.println("/review/like");
		String user_email = (String)session.getAttribute("sessionID");
		if(user_email == null) {
			JSONObject jobj = new JSONObject();
			jobj.put("islogin","false");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
			return;
		}
		int review_idx = Integer.parseInt(req.getParameter("reviewIdx"));
		String shopId = req.getParameter("shopId");
//		System.out.println("review_idx : " + review_idx);
//		System.out.println("shopId : " + shopId);
		
		//해당 리뷰에 현재 로그인자가 좋아요를 눌렀는지부터 판별시작
		if(reviewdao.reviewlikeCheck(user_email, review_idx) != null) {
			//좋아요 해제
			System.out.println("좋아요 했는데 또 누름");
			//like에 해당 리뷰에 현재 ID가 있으면 테이블에서 삭제 후 like count를 리턴
			//해당 리뷰의 좋아요 갯수 감소
			JSONObject jobj = new JSONObject();
			jobj.put("isLike","true");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
			
		}else {
			//좋아요 누름
			System.out.println("좋아요 누름");
			//like에 해당 리뷰에 현재 ID가 없으면 테이블에 추가 후 like count 리턴
			reviewdao.likeAdd(user_email, review_idx,shopId);
			reviewdao.likeReload(review_idx,reviewdao.likeCnt(review_idx));
			String cnt = reviewdao.likeCnt(review_idx)+"";
			//해당 리뷰의 좋아요 갯수 입력
			JSONObject jobj = new JSONObject();
			jobj.put("isLike","false");
			jobj.put("like",cnt);
			String jsonstr = jobj.toString();
			System.out.println(jsonstr);
			res.getWriter().write(jsonstr);
		}
	}
	@RequestMapping("/review/hate")
	public void reviewHate(HttpSession session,HttpServletResponse res,HttpServletRequest req) throws IOException {
		System.out.println("/review/hate");
		String user_email = (String)session.getAttribute("sessionID");
		if(user_email == null) {
			JSONObject jobj = new JSONObject();
			jobj.put("islogin","false");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
			return;
		}
		int review_idx = Integer.parseInt(req.getParameter("reviewIdx"));
		String shopId = req.getParameter("shopId");
		
		if(reviewdao.reviewhateCheck(user_email, review_idx) != null) {
			System.out.println("싫어요 했는데 또 누름");
			JSONObject jobj = new JSONObject();
			jobj.put("isHate","true");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
			
		}else {
			System.out.println("싫어요 누름");
			reviewdao.hateAdd(user_email, review_idx,shopId);
			reviewdao.hateReload(review_idx,reviewdao.hateCnt(review_idx));
			String cnt = reviewdao.hateCnt(review_idx)+"";
			JSONObject jobj = new JSONObject();
			jobj.put("isHate","false");
			jobj.put("hate",cnt);
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
		}
	}

	@RequestMapping("/reservation")
	public ModelAndView Reservation(ModelAndView mav, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ParseException {

		String user_email = (String) session.getAttribute("sessionID");
		String shop_title = req.getParameter("shop_title");
		String res_date = req.getParameter("res_date");
		int res_customer = Integer.parseInt(req.getParameter("res_customer"));
		String shop_id = req.getParameter("shop_id");
		String rev_phone = req.getParameter("rev_phone");
		java.util.Date date = new java.util.Date();
		java.sql.Date res_date2 = new java.sql.Date(date.getTime());
		System.out.println(res_date);
		System.out.println(user_email);
		System.out.println(shop_title);
		System.out.println(res_customer);
		System.out.println(shop_id);
		System.out.println(res_date2);
		System.out.println(rev_phone);
		ReservationVo resvo = new ReservationVo(user_email, shop_title, res_date2, res_customer, shop_id, null, null,
				rev_phone);
		resDao.insert_reservation(resvo);
		
		return mav;
	}


	@RequestMapping("/alert")
	public void Alert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String shop_id = request.getParameter("shop_id");
		String alert_new = "no";
		List<ReservationVo> alert_list = resDao.getAll_shopId(shop_id);
		if (alert_list != null) {
			for (int i = 0; i < alert_list.size(); i++) {
				if(alert_list.get(i).getAlert_new().equals("1")){
				alert_new = "exist";
				}
			}
			if(alert_new.equals("exist")){
			resDao.updateAlertNew_shopId(shop_id);
			}
			response.getWriter().write(alert_new);
		}
	}
}
