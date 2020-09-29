package com.javaex.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSession sqlsession;
	
	public NoticeDao() {}
	
	public NoticeDao(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	// 리스트(12개씩)
	public List<NoticeVo> noticeList(int pagenum) {
		List<NoticeVo> nlist = sqlsession.selectList("Notice.noticeList");
		List<NoticeVo> seclist = new ArrayList<NoticeVo>();
			
		// 해당 페이지 리스트(1=0-11,2=12-23)
		for(int i = (pagenum-1)*12; i<=pagenum*12-1; i++) {
			if(i<nlist.size()) {
				seclist.add(nlist.get(i));
			} else {
				break;
			}
		}
		return seclist;
	}
	// 넘기는 수
	Map<String, Object> map = new HashMap<String, Object>();
	public Map<String, Object> pagination() {
		List<NoticeVo> nlist = sqlsession.selectList("Notice.noticeList");
		int totalPage = /*(nlist.size()/12)+1*/35; // 전체 페이지 수
//		int nextPage = (totalPage/10);	// 다음 페이지
//		int rePage = (totalPage%10);	// 마지막 페이지 리스트?/
		int begin = 1;
		int end = 10;
		
			if(totalPage>=10) {
					map.put("begin", begin);
					map.put("end", end);		
			} else {
					map.put("begin", begin);
					map.put("end", totalPage);
			}
		return map;
	}
	public Map<String, Object> increse(int first){
		List<NoticeVo> nlist = sqlsession.selectList("Notice.noticeList");
		int totalPage = /*(nlist.size()/12)+1*/35; // 전체 페이지 수
		map.put("begin", first+10);
		
		int addend = Integer.parseInt(String.valueOf(map.get("end")))+10;
		System.out.println(addend);
		if(addend <= totalPage) {
			map.put("end", addend);
		} else {
			map.put("end", totalPage);
		}
		System.out.println("increase="+map);
		return map;
	}
	public Map<String, Object> decrease(int first){
		List<NoticeVo> nlist = sqlsession.selectList("Notice.noticeList");
		int totalPage = /*nlist.size()*/35; // 전체 페이지 수
		
		int subbegin = Integer.parseInt(String.valueOf(map.get("begin")))-10;
		if(subbegin > 10) {
			map.put("begin", subbegin);
		} else {
			map.put("begin", 1);
		}
		
		int subend = Integer.parseInt(String.valueOf(map.get("end")))-10;
		if(subend==0) {
			map.put("end", 10);
		} else if(Integer.parseInt(String.valueOf(map.get("end")))%10 !=0) {
			map.put("end", (int)Math.ceil((double)totalPage/10)*10-10);
		}else {
			map.put("end", subend);
		}
		System.out.println("decrease="+map);
		return map;
	}
	
	public void insertNotice() {
		sqlsession.insert("Notice.noticeInsert");
	}
	
	public void updateNotice() {
		sqlsession.update("Notice.noticeUpdate");
	}
	
	public void deleteNotice() {
		sqlsession.delete("Notice.noticeDelete");
	}

}
