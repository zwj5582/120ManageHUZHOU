package com.meliora.common;

import lombok.Data;
import org.displaytag.pagination.PaginatedList;
import org.displaytag.properties.SortOrderEnum;

import java.util.ArrayList;
import java.util.List;

@Data
public class PagedList<E> implements PaginatedList {

	private int fullListSize;
	private List<E> list = new ArrayList<>();
	private int objectsPerPage = 10;
	private int pageNumber = 1;
	private String searchId;
	private String sortCriterion;
	private SortOrderEnum sortDirection;

	public void setPageNumber(int pageNumber) {
		pageNumber=pageNumber<1?1:pageNumber;
		this.pageNumber = pageNumber;
	}

	public int getTotalPages() {
		return (fullListSize-1)/objectsPerPage+1;
	}
}
