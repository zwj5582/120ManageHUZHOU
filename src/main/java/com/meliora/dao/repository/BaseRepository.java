/*
 *  Created by ZhongWenjie on 2017-09-24 14:48
 */

package com.meliora.dao.repository;

import com.meliora.common.Criteria;
import com.meliora.common.PageBean;
import com.meliora.common.PagedList;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.io.Serializable;
import java.util.List;

@NoRepositoryBean
public interface BaseRepository<T, ID extends Serializable>
        extends PagingAndSortingRepository<T, ID> {

    T findOneByQueryString(String queryString);

    T findOneByCriteria(Criteria criteria);

    PagedList<T> findPageListByCriteria(Criteria criteria);

    PageBean findPageBeanByCriteria(Criteria criteria);

    PagedList<T> findPageList(PagedList<T> pagedList,String queryString);

    PageBean findPageBean(PageBean pageBean,String queryString);

    List<T> findByQueryString(String queryString);

    List<T> findByCriteria(Criteria criteria);

}