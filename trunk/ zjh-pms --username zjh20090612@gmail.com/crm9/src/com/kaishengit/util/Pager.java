package com.kaishengit.util;

import java.util.List;

public class Pager<T> {

	private int totalCount;
	private int pageSize =4;
	private int nowPageNum;
	private List<T> result;
	
	
	public Pager(int nowPageNum,int totalCount) {
		setTotalCount(totalCount);
		setNowPageNum(nowPageNum);
	}
	
	
	public int getTotalCount() {
		return totalCount;
	}
	private void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	/**
	 * ������������ÿҳ��ʾ�ļ�¼��������ҳ��
	 * @return
	 */
	public int getTotalPages() {
		int result = getTotalCount() / getPageSize();
		if(getTotalCount() % getPageSize() != 0) {
			result += 1;
		}else if(result<=0){
			result =1;
			
		}
		return result;
	}
	
	/**
	 * ��ȡ��ǰҳ��ʼ����
	 * @return
	 */
	public int getStartIndex() {
		int startIndex = (getNowPageNum() - 1) * getPageSize();
		return startIndex;
	}

	
	public int getNowPageNum() {
		return nowPageNum;
	}
	private void setNowPageNum(int nowPageNum) {
		if(nowPageNum < 1) {
			nowPageNum = 1;
		} else if(nowPageNum > getTotalPages()) {
			nowPageNum = getTotalPages();
		}
		this.nowPageNum = nowPageNum;
	}
	
	public List<T> getResult() {
		return result;
	}
	public void setResult(List<T> result) {
		this.result = result;
	}
	
	
	
	
}


