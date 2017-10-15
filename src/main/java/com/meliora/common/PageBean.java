package com.meliora.common;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * ���ܣ���ҳ����bean
 * @author lisongqiu
 * @version 1.0
 * ʱ��  2010-12-03
 * */
@SuppressWarnings("all")
@Data
public class PageBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private List list;          // Ҫ���ص�ĳһҳ�ļ�¼�б�
	private int totalRow=0;	    // �ܼ�¼��
	private int totalPage;      // ��ҳ��
	private int currentPage=1;  // ��ǰҳ(������ֵ)
	private int pageSize=10;    // ÿҳ��¼��(������ֵ)
	private int offset;         //��ǰҳ����������

	// ������ҳ��
	public int getTotalPage() {
		return (totalRow % pageSize == 0?totalRow / pageSize:totalRow / pageSize + 1)==0?1:(totalRow % pageSize == 0?totalRow / pageSize:totalRow / pageSize + 1);
	}

	//�ӵ�(currentPage-1)*pageSize����¼��ʼ����
	public int getOffset() {
		return (currentPage-1)*pageSize;
	}
}
