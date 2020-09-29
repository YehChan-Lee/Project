package com.javaex.model;

public class PageNavigator {
	
	private int countPerPage;		// 페이지당 글 목록 수 = 한 페이지에 몇개의 게시글을 보여줄 것인가?
	private int pagePerGroup;		// 그룹당 페이지 수 = 한 페이지 그룹당 몇 개의 페이지를 보여줄 것인가?
	private int currentPage;		// 현재 페이지(최근 글이 1부터 시작) = 사용자가 어느 페이지에 속해있는가?
	private int totalRecordCount;	// 전체 글 수 = DB count
	private int totalPageCount;		// 전체 페이지 수
	private int currentGroup;		// 현재 그룹(최근 그룹이 0부터 시작) = 사용자가 속한 페이지가 어느 페이지 그룹에 소속되는가?
	private int startPageGroup;		// 현재 그룹의 첫 페이지 = 그 페이지 그룹의 첫 페이지는 몇인가?
	private int endPageGroup;		// 현재 그룹의 마지막 페이지 = 그 페이지 그룹의 마지막 페이지는 몇인가?
	private int startRecord;		// 전체 레코드 중 현재 페이지 첫 글의 위치(0부터 시작) = 사용자가 속한 페이지의 첫 글의 위치는 무엇인가?
									// DB에서 select할 때, 몇 번째부터 몇 번째까지 데이터를 가져와야할지 알 수 있다.
	
	public PageNavigator(int countPerPage, int pagePerGroup, int currentPage, int totalRecordCount) {
		// 페이지당 글 수, 그룹당 페이지 수, 현재 페이지, 전체 글 수를 전달받음
		this.countPerPage = countPerPage;
		this.pagePerGroup = pagePerGroup;
		this.currentPage = currentPage;
		this.totalRecordCount = totalRecordCount;
		
		// 전체 페이지 수
		totalPageCount = (totalRecordCount +  countPerPage -1) / countPerPage;
		
		// 전달된 현재 페이지가 1보다 작으면 현재페이지를 1페이지로 고정
		if(currentPage < 1) {currentPage = 1;}
		// 전달된 현제 페이지가 마지막 페이지보다 크면 현재페이지를 마지막 페이지로 고정
		if(currentPage > totalPageCount) {currentPage = totalPageCount;}
		
		this.currentPage = currentPage;
		
		// 현재 그룹
		currentGroup = (currentPage -1) / pagePerGroup;
		
		//현재 그룹의 첫 페이지
		startPageGroup = currentGroup * pagePerGroup +1;
		// 현재 그룹의 첫 페이지가 1보다 작으면 1로 처리
		startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;
		// 현재 그룹의 마지막 페이지
		endPageGroup = startPageGroup + pagePerGroup -1;
		// 현재 그룹의 마지막 페이지가 전체 페이지 수보다 작으면 전체페이지 수를 마지막으로,
		endPageGroup = endPageGroup < totalPageCount ? endPageGroup : totalPageCount;
		
		// 전체 레코드 중 현재 페이지 첫 글의 위치
		startRecord = (currentPage - 1) * countPerPage;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getPagePerGroup() {
		return pagePerGroup;
	}

	public void setPagePerGroup(int pagePerGroup) {
		this.pagePerGroup = pagePerGroup;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	@Override
	public String toString() {
		return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
				+ currentPage + ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount
				+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
				+ endPageGroup + ", startRecord=" + startRecord + "]";
	}

}
