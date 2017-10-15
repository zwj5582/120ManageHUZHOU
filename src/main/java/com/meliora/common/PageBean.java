package com.meliora.common;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 功能：分页辅助bean
 * @author lisongqiu
 * @version 1.0
 * 时间  2010-12-03
 * */
@SuppressWarnings("all")
@Data
public class PageBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private List list;          // 要返回的某一页的记录列表
	private int totalRow=0;	    // 总记录数
	private int totalPage;      // 总页数
	private int currentPage=1;  // 当前页(必须设值)
	private int pageSize=10;    // 每页记录数(必须设值)
	private int offset;         //当前页数的首索引

	// 计算总页数
	public int getTotalPage() {
		return (totalRow % pageSize == 0?totalRow / pageSize:totalRow / pageSize + 1)==0?1:(totalRow % pageSize == 0?totalRow / pageSize:totalRow / pageSize + 1);
	}

	//从第(currentPage-1)*pageSize条记录开始索引
	public int getOffset() {
		return (currentPage-1)*pageSize;
	}
}
