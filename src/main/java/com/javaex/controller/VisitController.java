package com.javaex.controller;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


import com.javaex.model.VisitDao;
import com.javaex.model.VisitVo;

@Controller
public class VisitController implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent e) {
		HttpSession session = e.getSession();
		String visitId = session.getId();
		WebApplicationContext wac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(session.getServletContext());
		// 등록되어있는 빈을 사용할수 있도록 설정해준다

		// request를 파라미터에 넣지 않고도 사용할수 있도록 설정
		VisitDao visitDAO = (VisitDao) wac.getBean("visitDao");
		VisitVo vo = new VisitVo();
		vo.setVisit_id(visitId);
		System.out.println("방문자 세션 ID : " + visitId);
		visitDAO.insertVisit(vo);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent e) {
		/*HttpSession session = e.getSession();
		session.invalidate();
		System.out.println("세션 제거 완료");*/
	}
	
	
	
	
	
	
	
//	HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
//	.getRequest();
	// ipv6의 주소를 가져온것을 ipv4 변환 >> 0:0:0:0:0:0:0:1 >> 127.0.0.1
	// 메뉴의 Run -> Run Configurations -> Arguments 탭 ->
	// -Djava.net.preferIPv4Stack=true 추가
	/*
	 * HttpServletRequest req =
	 * ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).
	 * getRequest(); String custIP = req.getRemoteAddr(); getClientIpAddr(req);
	 */

	/*
	 * HttpSession session = e.getSession(); String visitIp = session.getId();
	 */
	/* String test = (String)session.setAttribute("test", visitIp); */
	/*
	 * System.out.println("test"+visitIp);
	 * 
	 * visitDao.insertVisit(visitIp);
	 * 
	 * System.out.println("방문자 IP: " + custIP);
	 */
	/*
	 * if(e.getSession().isNew()) { execute(e, visitIp); }
	 */
	/*
	 * HttpServletRequest req =
	 * ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).
	 * getRequest(); VisitVo VisitVo = new VisitVo();
	 * System.out.println("ip : "+req.getRemoteAddr());
	 * 
	 * VisitVo.setVisit_ip(req.getRemoteAddr()); HttpSession session =
	 * e.getSession(); System.out.println(session); String visitIp =
	 * session.getId(); System.out.println("세션 ID : " + visitIp);
	 * 
	 * System.out.println("vo : "+VisitVo); visitDao.insertVisit(VisitVo);
	 * visitDao.insertVisit(VisitVo);
	 */

	/*
	 * HttpSession session = e.getSession(); System.out.println(session);
	 * 
	 * String visitIp = session.getId();
	 * 
	 * visitDao.insertVisit(visitIp); System.out.println("세션 ID : " + visitIp);
	 * 
	 * 
	 * /*--------------------------------------------------------
	 */

	/*
	 * try { visitDao.insertVisit(new VisitVo(0, visitIp, null)); } catch (Exception
	 * e) { // TODO Auto-generated catch block e.printStackTrace(); }
	 */

	/*
	 * try { visitDao.insertVisit(visitIp); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); }
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

//	// 들어오는 IP 확인용
//	public void execute(HttpSessionEvent e, String vis) {
//		HttpSession session = e.getSession();
//		String visitIp = session.getId();
//		
//		try {
//			System.out.println("방문자 세션 ID : " + visitIp);
//		} catch (Exception e1) {
//			System.out.println("방문자 오류!");
//			e1.printStackTrace();
//		}
//
//	}
//
//	// IP 환경에 따라 필터링
//	public static String getClientIpAddr(HttpServletRequest request) {
//		String ip = request.getHeader("X-Forwarded-For");
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("Proxy-Client-IP");
//		}
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("WL-Proxy-Client-IP");
//		}
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("HTTP_CLIENT_IP");
//		}
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//		}
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getRemoteAddr();
//		}
//		return ip;
//	}

}