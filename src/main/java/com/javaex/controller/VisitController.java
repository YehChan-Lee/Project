package com.javaex.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.VisitDao;


@Controller
public class VisitController implements HttpSessionListener {
	
	@Autowired
	private VisitDao visitDao;
	
	/*@RequestMapping("/admin")
	public ModelAndView admin(ModelAndView mav) {
		System.out.println("/BabPool/admin");

		mav.addObject("Areview_list", admindao.Areview_list());
		mav.setViewName("admin/admin");
		return mav;
	}*/
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("세션 생성 이벤트");
		System.out.println(arg0);
		
		HttpSession session = arg0.getSession();
		WebApplicationContext wac =
				 WebApplicationContextUtils.getRequiredWebApplicationContext(session.
				 getServletContext());
		
		
		
		 
		System.out.println(session);

		String visitIp = session.getId();
		System.out.println("세션 ID : " + visitIp);
		
		visitDao.insertVisit(visitIp);
		
		
		/*--------------------------------------------------------*/
		
		/*try {
			visitDao.insertVisit(new VisitVo(0, visitIp, null));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		/*try {
			visitDao.insertVisit(visitIp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/

		/*
		 * HttpSession session = arg.getSession(); WebApplicationContext wac =
		 * WebApplicationContextUtils.getRequiredWebApplicationContext(session.
		 * getServletContext()); //등록되어있는 빈을 사용할수 있도록 설정해준다 HttpServletRequest req =
		 * ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).
		 * getRequest(); //request를 파라미터에 넣지 않고도 사용할수 있도록 설정 VisitDao visitDao =
		 * (VisitDao)wac.getBean("VisitDao_insert"); VisitVo vo = new VisitVo();
		 * vo.setVisit_ip(req.getRemoteAddr());
		 * 
		 * System.out.println(vo);
		 * 
		 * try { VisitDao.insertVisit(vo); } catch (Exception e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg) {
		System.out.println("세션 제거 완료");
		HttpSession session = arg.getSession();
		session.invalidate();
	}

}