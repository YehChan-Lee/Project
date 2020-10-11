package com.javaex.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
	public ModelAndView startPos(ModelAndView mav,HttpSession session) {
		String shopId = "123-12-12345";
		mav.addObject("Menu",posdao.getMenu(shopId));
		mav.addObject("reserveList",posdao.getReserveList(shopId));
		mav.addObject("reserveCnt",posdao.getReserveList(shopId).size());
		mav.addObject("table2",posdao.getTableInfo(shopId,2));
		mav.addObject("table3",posdao.getTableInfo(shopId,3));
		mav.addObject("payment",posdao.getPayment());
		session.setAttribute("table2Cnt",posdao.getTableInfo(shopId,2).size());
		session.setAttribute("table3Cnt",posdao.getTableInfo(shopId,3).size());
		mav.setViewName("pos/pos");
		return mav;
	}
	@RequestMapping("/pos/addmenu")
	public void addMenu(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("/pos/addmenu");
		String foodName = req.getParameter("food_name");
		String foodCnt = req.getParameter("food_cnt");
		System.out.println("foodName : " + foodName + "foodCnt : " + foodCnt);
	}

	@RequestMapping("/pos/alert")
	public void posAlert(HttpServletResponse res,HttpServletRequest req,HttpSession session) throws IOException {
		String shopId = "123-12-12345";
		int cnt = Integer.parseInt(req.getParameter("reserve_cnt"));
		int menucnt = Integer.parseInt(req.getParameter("menu_cnt"));
		int menucnt2 = Integer.parseInt(req.getParameter("menu_cnt2"));
		int newReservCnt = posdao.getReserveList(shopId).size();
		int newMenuCnt = posdao.getTableInfo(shopId,2).size();
		int newMenuCnt2 = posdao.getTableInfo(shopId,3).size();
		if(cnt != newReservCnt) {
			res.getWriter().write("deferent");
		}else if(menucnt != newMenuCnt && menucnt < newMenuCnt) {
			session.setAttribute("table2Cnt",posdao.getTableInfo(shopId,2).size());
			res.getWriter().write("menudeferent");
		}else if(menucnt2 != newMenuCnt2 && menucnt2 < newMenuCnt2) {
			session.setAttribute("table3Cnt",posdao.getTableInfo(shopId,3).size());
			res.getWriter().write("menudeferent");
		}else if(menucnt > newMenuCnt || menucnt2 > newMenuCnt2) {
			res.getWriter().write("payment");
		}
	}
	
	@RequestMapping("/pos/payment")
	public void posPayment(HttpServletResponse res,HttpServletRequest req,HttpSession session) throws IOException, ParseException {
		System.out.println("/pos/payment");
		String[] test = req.getParameter("pay_date").split("\\.");
		String email = req.getParameter("user_email");
		String date = test[0];
		JSONObject jobj = new JSONObject();
		
		List<HashMap<String,Object>> list = posdao.getPay(email, date);
		for(int i=0;i<list.size();i++) {
			jobj.put("menu"+i, list.get(i));
		}
		
		
		String jsonstr = jobj.toString();
		res.getWriter().write(jsonstr);
	}
}
