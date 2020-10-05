package com.javaex.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.MenuDao;
import com.javaex.model.MenuVo;
import com.javaex.model.AllDao;
import com.javaex.model.NoticeDao;
import com.javaex.model.ReservationDao;
import com.javaex.model.ReservationVo;
import com.javaex.model.ReviewDao;
import com.javaex.model.ReviewVo;
import com.javaex.model.ShopDao;
import com.javaex.model.ShopDibsDao;
import com.javaex.model.ShopUserDao;
import com.javaex.model.ShopUserVo;
import com.javaex.model.ShopVo;

@Controller
public class ListController {
	
	//String number;
	
	@Autowired
	MenuDao menudao;
	
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

	@Autowired
	AllDao alldao;

	@Autowired
	ShopDibsDao dibdao;

	String url = "C:\\Users\\Kosmo_23\\Desktop\\백업\\Project\\webapp\\serverImg\\";
	

	@RequestMapping("/review_upload")
	public void test(ModelAndView mav,MultipartHttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws IOException {
		System.out.println("/BabPool/review_upload");
		String user_email = (String) session.getAttribute("sessionID");
		if (user_email == null) {
			res.getWriter().write("notLogin");
			return;
		}
		if (req.getParameter("hidden_grade").equals("") || req.getParameter("review_area").equals("")) {
			res.getWriter().write("reviewinput");
			return;
		}

		List<MultipartFile> fileList = req.getFiles("inputImage");// input file타입 파라미터
		double reviewScore = Double.parseDouble(req.getParameter("hidden_grade"));// 별점
		String review = req.getParameter("review_area");// 리뷰내용
		String shopId = req.getParameter("shopId");
		req.setAttribute("shopId", shopId);
		
		String folder = "review\\";// 이미지 저장 경로
		String path = "";
		String fileName = "";
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			fileName = "review" + reviewdao.reviewCnt(shopId) + shopId + originFileName;
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
			path += fileName + "/";
		}
		reviewdao.reviewUpload(new ReviewVo(0, shopId, user_email, reviewScore, review, path, 0, 0));
		dao.reviewCntReload(shopId, reviewdao.reviewCnt(shopId));
		
		userDao.reviewCntUpload(user_email);
		dao.scoreCalc(shopId);
		res.getWriter().write("success");
	}

	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mav, HttpServletRequest request, HttpSession session) {
		System.out.println("/BabPool/list");
		List<ShopVo> list = dao.shopSearch(request.getParameter("location"), request.getParameterValues("shop_addr"),
				request.getParameterValues("food_type"), request.getParameter("string_search"),
				request.getParameter("solt"), request.getParameter("price_list"),
				request.getParameterValues("add_info"), request.getParameterValues("table_type"),
				request.getParameterValues("alcohol_type"), request.getParameter("parking_available"));

		List<ShopVo> seclist = new ArrayList<ShopVo>();
		int pagenum = 1;
		if (request.getParameter("page") != null) {
			pagenum = Integer.parseInt(request.getParameter("page"));
		} else {
			pagenum = 1;
		}
		// 해당 페이지 리스트(1=0-11,2=12-23)
		for (int i = (pagenum - 1) * 12; i <= pagenum * 12 - 1; i++) {
			if (i < list.size()) {
				seclist.add(list.get(i));
			} else {
				break;
			}
		}
		if (session.getAttribute("sessionID") != null) {
			String user_email = (String) session.getAttribute("sessionID");
			System.out.println("list에 sesssionID" + user_email);
			mav.addObject("dibList", dibdao.getDibList(user_email));
		}
		mav.addObject("shopList", seclist);
		mav.addObject("shopListCnt", list.size());
		// 예약 카운트 갱신
//		ArrayList<ShopVo> list = (ArrayList<ShopVo>)dao.shopList();
//		for(int i=0;i<list.size();i++) {
//			String shopID = list.get(i).getShop_id();
//			int cnt = dao.getReservCnt(shopID);
//			dao.reserveCntUp(cnt, shopID);			
//		}		
		mav.setViewName("list");
		return mav;
	}

	@RequestMapping("/list/dib")
	public void dibs(ModelAndView mav, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws IOException {
		System.out.println("/BabPool/list/dibs");
		String shopId = req.getParameter("shopId");
		int shopIdx = Integer.parseInt(req.getParameter("shopIdx"));
		if (session.getAttribute("sessionID") == null) {
			res.getWriter().write("nologin");
			return;
		} else {
			//로그인 되어있으면 넘어온다.
			String email = (String) session.getAttribute("sessionID");
			//찜이 되어 있는지 우선 확인
			if(dibdao.dibCheck(email,shopId)) {
				//찜이 되어있으면 찜해제
				dibdao.delDib(email,shopId);
				res.getWriter().write("deldib");
			}else {
				//찜이 안되어있으면 찜하기
				dibdao.addDib(email, shopId,shopIdx);		
				res.getWriter().write("adddib");
			}
			mav.addObject("sessionID", email);
						
		}
	}

	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mav, HttpServletRequest request, HttpSession session) {
		System.out.println("/BabPool/detail");
		String user_email = (String) session.getAttribute("sessionID");
		String shop_idx = request.getParameter("shopidx");

		if (user_email != null) {
			userDao.update_recentShop_shopIdx(user_email, shop_idx);
			ShopUserVo user;
			user = userDao.loginCheck(user_email);
			if (user.getRecent_shop() != null) {
				ShopVo recent_shopList = dao.getAll_shopIdx(user.getRecent_shop());
				session.setAttribute("shop_title", recent_shopList.getShop_title());
				session.setAttribute("food_type", recent_shopList.getFood_type());
				session.setAttribute("shop_addr", recent_shopList.getShop_addr());
				session.setAttribute("shop_idx", recent_shopList.getShop_idx());
			}
		}
		int shopIdx = Integer.parseInt(request.getParameter("shopidx"));
		// cnt 가져오기위한 먼저 shop 호출
		ShopVo shop = dao.shopOne(shopIdx);
		String ShopId = shop.getShop_id();
		// cnt 증가후 다시 shop 호출
		dao.viewUp(ShopId);
		shop = dao.shopOne(shopIdx);
		mav.addObject("ShopPhoto", dao.getShopPhoto(user_email));
		mav.addObject("shopTop5",dao.getTop5());
		mav.addObject("shopOne", shop);
		mav.setViewName("detail/detail");
		return mav;
	}
	@RequestMapping("/isDib")
	public void isDib(HttpServletRequest request, HttpSession session) {
		System.out.println("/BabPool/detail");
		
	}

	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		System.out.println("/BabPool/login");

		String user_email = request.getParameter("user_id");
		String password = request.getParameter("user_pw");

		ShopUserVo user = userDao.loginCheck(user_email);
		if (userDao.loginCheck(user_email) != null) {
			if (user.getUser_pw().equals(password)) {
				response.getWriter().write("success");
				session.setAttribute("is_owner", user.getIs_owner());
				session.setAttribute("sessionID", user_email);
				session.setAttribute("user_photo", user.getUser_photo());
				if (user.getRecent_shop() != null) {
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
		} else if (user_email.equals("admin@babpool.com")) {
			response.getWriter().write("admin");
		} else {
			response.getWriter().write("fail");
		}
	}

	@RequestMapping("/logout")
	public void logout(HttpSession session,HttpServletResponse res) throws IOException {
		System.out.println("/BabPool/logout");
		session.invalidate();
		res.getWriter().write("logout");
	}

	@RequestMapping("/join")
	public ModelAndView signup(ModelAndView mav, HttpServletRequest req) {
		System.out.println("/BabPool/signup");
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String birth = req.getParameter("bir_year") + "-" + req.getParameter("bir_mon") + "-"
				+ req.getParameter("bir_day");
		String gender = req.getParameter("gender");
		String phone = req.getParameter("phone");
		int joinType = Integer.parseInt(req.getParameter("join_type"));

		if (joinType == 1) {
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "0", null, 0, null, 0, 0));
		} else {
			String buisnessNumber = req.getParameter("buisness_number");
			String buisnessName = req.getParameter("buisness_name");
			String buisnessAddress = req.getParameter("buisness_address");
			String buisnessAddressEtc = req.getParameter("buisness_address_etc");
			String buisnessFoodType = req.getParameter("buisness_food_type");

			System.out.println(buisnessNumber + " " + buisnessName + " " + buisnessAddress + " " + buisnessAddressEtc
					+ " " + buisnessFoodType);
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "1", null, 0, null, 0, 0));
		}
		mav.setViewName("main");
		return mav;
	}

	// 공지사항
	@RequestMapping("/notice")
	public ModelAndView notice(ModelAndView mav) {
		System.out.println("/BabPool/notice => Notice_Page");
		mav.addObject("Notice", noticedao.noticeList());
		mav.setViewName("notice");
		return mav;
	}

	@RequestMapping("/detail/info.do")
	public ModelAndView detail_info(ModelAndView mav, HttpServletRequest request) {
		System.out.println("/BabPool/detail_info");
		int shop_idx = Integer.parseInt(request.getParameter("shopidx"));
		mav.addObject("shopOne", dao.shopOne(shop_idx));
		mav.setViewName("detail/detail_info");
		return mav;
	}

	@RequestMapping("/detail/menu.do")
	public ModelAndView detail_menu(ModelAndView mav,HttpServletResponse response, HttpServletRequest req) {
		String shopId = req.getParameter("shopId");
		mav.addObject("shopMenu", dao.getMenu(shopId));
		mav.setViewName("detail/detail_menu");
		return mav;
	}

	
	@RequestMapping("/buisness_update")
	public void buisnessmypage_update(HttpServletResponse response , MultipartHttpServletRequest req) throws IOException {
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
		String hash_tag = req.getParameter("hash_tag");
		String comma = "";
		
		List<MultipartFile> fileList = req.getFiles("shop_photo");
		List<MultipartFile> fileList2 = req.getFiles("shop_subphoto");
		
		String folder = "shopsubimg\\";
		String folder2 = "shopimg\\";
		String path = "";
		String fileName = "";
		String path2 = "";
		
		for (MultipartFile mf : fileList2) {
			String originFileName = mf.getOriginalFilename();
			fileName = "shopsubimg" + shop_id + originFileName;
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
			path2 += fileName + "/";
			
		}
		
		
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			fileName = "shopimg" + shop_id + originFileName;
			String safeFile = url + folder2 + fileName;
			
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
			path += fileName + "/";
		}
		

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
		
		
		
		if (shop_id.equals("")) {
			response.getWriter().write("shopid_null");
		} else if (shop_addr.equals("")) {
			response.getWriter().write("shopaddr_null");
		} else if (shop_location.equals("")) {
			response.getWriter().write("shoplocation_null");
		} else if (food_type.equals("")) {
			response.getWriter().write("foodtype_null");
		} else {
			response.getWriter().write("update");
			ShopVo s = new ShopVo(shop_title,shop_id, shop_addr,  shop_location, food_type, shop_tip, budget, shop_comment,
					shop_phone, shop_time, shop_addinfo, shop_tb, shop_alcohol, shop_car, shop_close, path,hash_tag, path2);
			dao.updateShop(s);
		}

	}

	@RequestMapping("/buisnessmypage/registration2")
	public ModelAndView registration2(ModelAndView mav, HttpSession session) {
		mav.addObject("shopOwnerList", dao.shopOwnerList((String) session.getAttribute("sessionID")));
		System.out.println("/reservation2");
		String shop_id = (String)session.getAttribute("shop_id");
		mav.addObject("menu", menudao.MenuOne(shop_id));
		mav.setViewName("buisnessmypage/buisness_mypage_registration2");
		return mav;
	}

	@RequestMapping("/review/like")
	public void reviewLike(HttpSession session, HttpServletResponse res, HttpServletRequest req) throws IOException {
		System.out.println("/review/like");
		String user_email = (String) session.getAttribute("sessionID");
		if (user_email == null) {
			JSONObject jobj = new JSONObject();
			jobj.put("islogin", "false");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
			return;
		}
		int review_idx = Integer.parseInt(req.getParameter("reviewIdx"));
		String shopId = req.getParameter("shopId");
//		System.out.println("review_idx : " + review_idx);
		System.out.println("reviewlike ==> shopId : " + shopId);

		// 해당 리뷰에 현재 로그인자가 좋아요를 눌렀는지부터 판별시작
		if (reviewdao.reviewlikeCheck(user_email, review_idx) != null) {
			// 좋아요 해제
			System.out.println("좋아요 했는데 또 누름");
			// like에 해당 리뷰에 현재 ID가 있으면 테이블에서 삭제 후 like count를 리턴
			// 해당 리뷰의 좋아요 갯수 감소
			JSONObject jobj = new JSONObject();
			jobj.put("isLike", "true");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);

		} else {
			// 좋아요 누름
			System.out.println("좋아요 누름");
			// like에 해당 리뷰에 현재 ID가 없으면 테이블에 추가 후 like count 리턴
			reviewdao.likeAdd(user_email, review_idx, shopId);
			reviewdao.likeReload(review_idx, reviewdao.likeCnt(review_idx));
			String cnt = reviewdao.likeCnt(review_idx) + "";
			// 해당 리뷰의 좋아요 갯수 입력
			JSONObject jobj = new JSONObject();
			jobj.put("isLike", "false");
			jobj.put("like", cnt);
			String jsonstr = jobj.toString();
			System.out.println(jsonstr);
			res.getWriter().write(jsonstr);
		}
	}

	@RequestMapping("/review/hate")
	public void reviewHate(HttpSession session, HttpServletResponse res, HttpServletRequest req) throws IOException {
		System.out.println("/review/hate");
		String user_email = (String) session.getAttribute("sessionID");
		if (user_email == null) {
			JSONObject jobj = new JSONObject();
			jobj.put("islogin", "false");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
			return;
		}
		int review_idx = Integer.parseInt(req.getParameter("reviewIdx"));
		String shopId = req.getParameter("shopId");

		if (reviewdao.reviewhateCheck(user_email, review_idx) != null) {
			System.out.println("싫어요 했는데 또 누름");
			JSONObject jobj = new JSONObject();
			jobj.put("isHate", "true");
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);

		} else {
			System.out.println("싫어요 누름");
			reviewdao.hateAdd(user_email, review_idx, shopId);
			reviewdao.hateReload(review_idx, reviewdao.hateCnt(review_idx));
			String cnt = reviewdao.hateCnt(review_idx) + "";
			JSONObject jobj = new JSONObject();
			jobj.put("isHate", "false");
			jobj.put("hate", cnt);
			String jsonstr = jobj.toString();
			res.getWriter().write(jsonstr);
		}
	}

	@RequestMapping("/reservation")
	public void Reservation(HttpServletRequest req,
			HttpSession session,HttpServletResponse response) throws ParseException, IOException {
		String user_email = (String) session.getAttribute("sessionID");
		String shop_title = req.getParameter("shop_title");
		int res_customer = Integer.parseInt(req.getParameter("res_customer"));
		String shop_id = req.getParameter("shop_id");
		String rev_phone = req.getParameter("rev_phone");
		java.util.Date date = new java.util.Date();
		java.sql.Date res_date2 = new java.sql.Date(date.getTime());
		String res_name = req.getParameter("res_name");
		String state = "";
		ReservationVo resvo = new ReservationVo(user_email, shop_title, res_date2, res_customer, shop_id, null, null,
				rev_phone, res_name);
		
		
		if (rev_phone.equals("") || res_name.equals("")) {
			state = "fail";
			response.getWriter().write(state);
		} else {
			state = "success";
			response.getWriter().write(state);
			resDao.insert_reservation(resvo);
		}

		dao.reserveCntUp(dao.getReservCnt(shop_id), shop_id);
	}

	@RequestMapping("/alert")
	public void Alert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String shop_id = request.getParameter("shop_id");
		String alert_new = "no";
		List<ReservationVo> alert_list = resDao.getAll_shopId(shop_id);
		if (alert_list != null) {
			for (int i = 0; i < alert_list.size(); i++) {
				if (alert_list.get(i).getAlert_new().equals("1")) {
					alert_new = "exist";
				}
			}
			if (alert_new.equals("exist")) {
				resDao.updateAlertNew_shopId(shop_id);
			}
			response.getWriter().write(alert_new);
		}
	}

	@RequestMapping("/buisnessmypage/reservation2")
	public ModelAndView reservation2(ModelAndView mav, HttpServletRequest req,HttpSession session) {
		System.out.println("/reservation2");
		String a = (String)session.getAttribute("shop_id");
		mav.addObject("reservation", resDao.reservationOne(a));
		List <ReservationVo> aa = resDao.reservationOne(a);
		for(int i=0; i<aa.size(); i++) {
			System.out.println(aa.get(i).getUser_email());
		}
		mav.setViewName("buisnessmypage/buisness_mypage_reservation2");
		return mav;
	}
	
	@RequestMapping("/idSearch")
	public void findemail(HttpServletRequest req,  HttpServletResponse response) throws IOException {
		System.out.println("/idSearch");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String find_email =  req.getParameter("find_email");
		String find_phone =  req.getParameter("find_phone");
		map.put("user_name", find_email);
		map.put("user_phone", find_phone);
		
	
		String user_email = userDao.selectemail(map);
		if(user_email == null) {
			response.getWriter().write("fail");
		}else {
			response.getWriter().write(user_email);
		}
	}
	
	
	@RequestMapping("/pwSearch")
	public void pwSearch(HttpServletRequest req,  HttpServletResponse response) throws IOException {
		System.out.println("/pwSearch");
		String pwsearch_email =  req.getParameter("pwsearch_email");
		String state = "fail";
		
		List<String> user_email = userDao.searchemail();
		if(user_email == null) {
			response.getWriter().write(state);
		}else {
			for(int i =0 ;i < user_email.size();i++) {
				if(user_email.get(i).equals(pwsearch_email)) {
					state = "success";
				
					response.getWriter().write("1234");
					return;
				}
			}
			if(state.equals("fail")) {
				response.getWriter().write(state);
			}
			
		}
	}
	
	@RequestMapping("/pwSearch2")
	public void pwSearch2(HttpServletRequest req,  HttpServletResponse response) throws IOException {
		System.out.println("/pwSearch2");
		String email_number =  req.getParameter("email_number");
		String state = "fail";
		
		if(email_number.equals("1234")) {
			state = "success";
			response.getWriter().write(state);
		}
		else if(state.equals("fail")) {
			response.getWriter().write(state);
		}
		
	}
	
	@RequestMapping("/pwupdate")
	public void pwupdate(HttpServletRequest req,  HttpServletResponse response) throws IOException {
		System.out.println("/pwupdate");
		String pwsearch_email = req.getParameter("pwsearch_email");
		String repassword = req.getParameter("repassword");
		String repassword2 = req.getParameter("repassword2");
		
		if (repassword.equals(repassword2)) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("user_email", pwsearch_email);
			map.put("user_pw", repassword);
			userDao.updatepassword(map);
			response.getWriter().write("success");
		} else {
			response.getWriter().write("fail");
		}
	
	
	}
	@RequestMapping("/menu_insert")
	public void menu_insert(ModelAndView mav,HttpServletRequest req,HttpServletResponse response
			) throws IOException {

		System.out.println("/menu_insert");
		String shop_id = req.getParameter("shop_id");
		String food_name = req.getParameter("food_name");
		String food_price = req.getParameter("food_price");
		String food_info = req.getParameter("food_info");
		System.out.println(shop_id);
		System.out.println(food_name);
		System.out.println(food_price);
		System.out.println(food_info);
		if(food_name.equals("")) {
			response.getWriter().write("fail");
		} else if (food_price.equals("")){
			response.getWriter().write("fail2");
		} else if (food_info.equals("")) {
			response.getWriter().write("fail3");
		} else {
			response.getWriter().write("success");
			MenuVo menuvo = new MenuVo(shop_id, food_name, food_price, food_info);
			menudao.insert_menu(menuvo);
		}		
	}
	
	@RequestMapping("detail/reviewList")
	public ModelAndView reviewList(ModelAndView mav, HttpSession session, HttpServletRequest req) {
		String shopId = req.getParameter("shopId");
		String user_email = (String) session.getAttribute("sessionID");
		String sort = req.getParameter("sort");
		if (user_email != null) {
			mav.addObject("likeList", reviewdao.likeList(user_email, shopId));
			mav.addObject("hateList", reviewdao.hateList(user_email, shopId));
		}
		if (sort.equals("new")) {
			mav.addObject("reviewList", alldao.shopreviewList(shopId, "new"));
		} else if (sort.equals("popular")) {
			mav.addObject("reviewList", alldao.shopreviewList(shopId, "popular"));
		} else {
			mav.addObject("reviewList", alldao.shopreviewList(shopId, "new"));
		}
		mav.setViewName("detail/detail_reviewList");
		return mav;
	}

	@RequestMapping("review/del")
	public void reviewDel(HttpSession session, HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("review/del");
		String user_email = (String) session.getAttribute("sessionID");
		if (user_email == null) {
			res.getWriter().write("nologin");
			return;
		}
		String delEmail = req.getParameter("delEmail");
		int delIdx = Integer.parseInt(req.getParameter("delIdx"));
		System.out.println(delIdx + "//" + delEmail);

		if (delEmail.equals(user_email)) {
			// 리뷰삭제
			reviewdao.delReview(delIdx);
			res.getWriter().write("success");
			return;
		} else {
			// 리뷰삭제 불가
			res.getWriter().write("delFail");
			return;
		}

	}
	
	@RequestMapping("/menu_delete")
	public void menu_delete(ModelAndView mav,HttpServletRequest req,HttpServletResponse response
			) throws IOException {
		System.out.println("/menu_delete");
		String food_name = req.getParameter("food_name");
		String shop_id = req.getParameter("shop_id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("food_name", food_name);
		map.put("shop_id", shop_id);
		menudao.DeleteMenu(map);

	}
}

