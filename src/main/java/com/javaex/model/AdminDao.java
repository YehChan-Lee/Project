package com.javaex.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession sqlSession;

	public AdminDao(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}

	public AdminVo Aadmin_id() {
		AdminVo adminvo = sqlSession.selectOne("AdminVo.Aadmin_id");
		/* System.out.println(adminvo) */;
		return adminvo;
	}

	public List<AdminVo> Areview_list(String pSea, String pSea_txt) {
		if (pSea.equals("null") && pSea_txt.equals("null")) {
			List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Areview_list");
			return adminvo;
		} else if (pSea.equals("author")) {
			List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Areview_list1", pSea_txt);
			return adminvo;
		} else {
			List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Areview_list2", pSea_txt);
			return adminvo;
		}

		/*
		 * System.out.println(adminvo.size()); for (int i = 0; i < adminvo.size(); i++)
		 * { System.out.println(adminvo.get(i)); }
		 */
	}

	public List<AdminVo> Amember_list() {
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Amember_list");
		/*
		 * System.out.println(adminvo.size()); for (int i = 0; i < adminvo.size(); i++)
		 * { System.out.println(adminvo.get(i)); }
		 */
		return adminvo;
	}

	public List<AdminVo> Acompany_list() {
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Acompany_list");
		/*
		 * System.out.println(adminvo.size()); for (int i = 0; i < adminvo.size(); i++)
		 * { System.out.println(adminvo.get(i)); }
		 */
		return adminvo;
	}

	public List<AdminVo> Acompany2_list() {
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Acompany2_list");
		/*
		 * System.out.println(adminvo.size()); for (int i = 0; i < adminvo.size(); i++)
		 * { System.out.println(adminvo.get(i)); }
		 */
		return adminvo;
	}

	public List<AdminVo> AresSitu_list() {
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.AresSitu_list");
		/*
		 * System.out.println(adminvo.size()); for (int i = 0; i < adminvo.size(); i++)
		 * { System.out.println(adminvo.get(i)); }
		 */
		return adminvo;
	}

	public List<AdminVo> AresSitu_info(int numIdx) {
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.AresSitu_info", numIdx);
		/*
		 * System.out.println(adminvo.size()); for (int i = 0; i < adminvo.size(); i++)
		 * { System.out.println(adminvo.get(i)); }
		 */
		return adminvo;
	}

	public List<AdminVo> Anotice_list() {
		List<AdminVo> adminvo = sqlSession.selectList("Anotice_list");

//		System.out.println(adminvo.size());
//		for (int i = 0; i < adminvo.size(); i++) {
//			System.out.println(adminvo.get(i));
//		}

		return adminvo;
	}

	public List<AdminVo> Anotice_list_info(int idx) {
		
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Anotice_list_info", idx);
//		System.out.println(adminvo.size());
//		for (int i = 0; i < adminvo.size(); i++) {
//			System.out.println(adminvo.get(i));
//		}
		return adminvo;
	}

	public List<AdminVo> Anotice_list_modify(int numIdx) {
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.Anotice_list_modify", numIdx);
		/*
		 * System.out.println(adminvo.size()); for (int i = 0; i < adminvo.size(); i++)
		 * { System.out.println(adminvo.get(i)); }
		 */
		return adminvo;
	}

	public int admin_appli() {
		List<AdminVo> adminvo = sqlSession.selectList("AdminVo.admin_Application");
		return adminvo.size();
	}

	public void admin_notice_del(int idx) {
		sqlSession.delete("AdminVo.Anotice_infoDel", idx);
	}
	
	public void admin_notice_modi(NoticeVo vo) {
		 sqlSession.update("AdminVo.Anotice_modi", vo);	
	}
	
	public void admin_AcomState1(ShopVo vo) {
		 sqlSession.update("AdminVo.AcomState1", vo);
	}
	
	public void admin_AcomState2(ShopVo vo) {
		 sqlSession.update("AdminVo.AcomState2", vo);
	}
}
