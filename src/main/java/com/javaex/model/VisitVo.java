package com.javaex.model;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component
public class VisitVo {
	private int visit_idx;
	private String visit_id;
	private Date visit_date;
	
	public VisitVo() {
		
	}

	public VisitVo(int visit_idx, String visit_id, Date visit_date) {
		this.visit_idx = visit_idx;
		this.visit_id = visit_id;
		this.visit_date = visit_date;
	}

	public int getVisit_idx() {
		return visit_idx;
	}

	public void setVisit_idx(int visit_idx) {
		this.visit_idx = visit_idx;
	}

	public String getVisit_id() {
		return visit_id;
	}

	public void setVisit_id(String visit_id) {
		this.visit_id = visit_id;
	}

	public Date getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}

	@Override
	public String toString() {
		return "VisitVo [visit_idx=" + visit_idx + ", visit_id=" + visit_id + ", visit_date=" + visit_date + "]";
	}

}
