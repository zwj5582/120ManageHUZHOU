/*
 *  Created by ZhongWenjie on 2017-09-24 14:50
 */

package com.meliora.dao.repository.impl;

import com.meliora.common.*;
import com.meliora.dao.repository.BaseRepository;
import com.meliora.util.CriteriaUtils;
import com.meliora.util.TimeUtil;
import com.meliora.util.Util;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Slf4j
@SuppressWarnings("unchecked")
public class BaseRepositoryImpl<T, ID extends Serializable>
        extends SimpleJpaRepository<T, ID>
        implements BaseRepository<T, ID> {

    private EntityManager entityManager;

    private final Class<T> domainClass;

    public BaseRepositoryImpl(Class<T> domainClass, EntityManager entityManager) {
        super(domainClass, entityManager);
        this.domainClass = domainClass;
        this.entityManager=entityManager;
    }

    @Override
    public T findOneByQueryString(String queryString) {
        try {
            return (T)entityManager.createQuery(queryString).getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }

    @Override
    public T findOneByCriteria(Criteria criteria) {
        String queryString = createSimpleHQL(criteria);
        try {
            return (T)entityManager.createQuery(queryString).getSingleResult();
        }catch (NoResultException e){
            return null;
        }
    }

    @Override
    public PagedList<T> findPageListByCriteria(Criteria criteria) {
        PagedList<T> pagedList =
                Util.valid(criteria.getPagedList()) ? criteria.getPagedList() : new PagedList<>();
        String queryString = createSimpleHQL(criteria);
        try {
            return findPageList(pagedList,queryString);
        }catch (NoResultException e){
            return pagedList;
        }
    }

    @Override
    public PageBean findPageBeanByCriteria(Criteria criteria) {
        PageBean pageBean =
                Util.valid(criteria.getPageBean()) ? criteria.getPageBean() : new PageBean();
        String queryString = createSimpleHQL(criteria);
        try {
            return findPageBean(pageBean,queryString);
        }catch (NoResultException e){
            return pageBean;
        }
    }

    @Override
    public PagedList<T> findPageList(PagedList<T> pagedList, String queryString) {
        try {
            List<T> resultList = entityManager.createQuery(queryString)
                    .setMaxResults(pagedList.getObjectsPerPage())
                    .setFirstResult((pagedList.getPageNumber() - 1) * pagedList.getObjectsPerPage())
                    .getResultList();
            pagedList.setList(resultList);
            return pagedList;
        }catch (NoResultException e){
            return pagedList;
        }
    }

    @Override
    public PageBean findPageBean(PageBean pageBean, String queryString) {
        try {
            List<T> resultList = entityManager.createQuery(queryString)
                    .setMaxResults(pageBean.getPageSize())
                    .setFirstResult((pageBean.getCurrentPage() - 1) * pageBean.getPageSize())
                    .getResultList();
            pageBean.setList(resultList);
            return pageBean;
        }catch (NoResultException e){
            return pageBean;
        }
    }

    @Override
    public List<T> findByQueryString(String queryString) {
        try {
            return entityManager.createQuery(queryString).getResultList();
        }catch (NoResultException e){
            return null;
        }
    }

    @Override
    public List<T> findByCriteria(Criteria criteria) {
        try {
            return entityManager.createQuery(createSimpleHQL(criteria)).getResultList();
        }catch (NoResultException e){
            return null;
        }
    }

    private String createSimpleHQL(Criteria criteria){
        String queryString=" from " + domainClass.getSimpleName()+" as model ";
        List<String> leftJoinFetchS = criteria.getLeft_join_fetch_s();
        List<CriteriaFilter> filters = criteria.getFilters();
        List<CriteriaOR> ors = criteria.getOrs();
        List<CriteriaSort> sorts = criteria.getSorts();
        List<CriteriaGroupBy> groupByList = criteria.getGroupBys();
        if (Util.valid(leftJoinFetchS)){
            for (String leftJoinFetch : leftJoinFetchS){
                queryString += " left join fetch "+leftJoinFetch+" ";
            }
        }
        queryString += " where 1=1 ";
        if (Util.valid(filters)){
            for (CriteriaFilter filter : filters){
                queryString= CriteriaUtils.parsePerCriteraFilter(queryString,"and",filter);
            }
        }
        if (Util.valid(ors)){
            for (CriteriaOR or : ors){
                List<CriteriaFilter> filterList = or.getFilters();
                if (Util.valid(filterList)){
                    queryString += " and ( 0=1 ";
                    for (CriteriaFilter filter : filterList){
                        queryString= CriteriaUtils.parsePerCriteraFilter(queryString,"or",filter);
                    }
                    queryString += " ) ";
                }
            }
        }
        if (Util.valid(groupByList)){
            queryString += " group by ";
            for (CriteriaGroupBy groupBy : groupByList){
                queryString += " "+ groupBy.getProperty()+" , ";
            }
            queryString=queryString.substring(0,queryString.length()-2);
        }
        if (Util.valid(sorts)){
            queryString += " order by ";
            for (CriteriaSort sort : sorts){
                queryString += " "+sort.getProperty()+" "+sort.getDirection()+" , ";
            }
            queryString=queryString.substring(0,queryString.length()-2);
        }
        log.info("queryString: "+queryString);
        return queryString;
    }

}
