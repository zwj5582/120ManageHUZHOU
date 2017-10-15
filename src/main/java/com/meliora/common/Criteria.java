/*
 *  Created by ZhongWenjie on 2017-09-23 14:18
 */

package com.meliora.common;

import com.google.common.collect.Lists;
import com.meliora.util.CriteriaUtils;
import lombok.Data;

import java.util.List;

@Data
public class Criteria {

    private List<String> left_join_fetch_s=Lists.newArrayList();

    private List<CriteriaFilter> filters = Lists.newArrayList();

    private List<CriteriaSort> sorts = Lists.newArrayList();

    private List<CriteriaGroupBy> groupBys = Lists.newArrayList();

    private List<CriteriaOR> ors = Lists.newArrayList();

    private PagedList pagedList;

    private PageBean pageBean;

    public Criteria addFilter(CriteriaFilter filter){
        filters.add(filter);
        return this;
    }

    public Criteria addSort(CriteriaSort sort){
        sorts.add(sort);
        return this;
    }

    public Criteria addFilter(String property, Object value,Object... conditions){
        return addFilter
                (CriteriaUtils.createCriteriaFilterBuilder(property,value,conditions).build());
    }

    public Criteria addOr(CriteriaOR criteriaOR){
        ors.add(criteriaOR);
        return this;
    }

    public Criteria addSort(String property){
        return addSort(CriteriaSort.builder(property).build());
    }

    public Criteria addSort(String property, CriteriaSort.Direction direction){
        return addSort(CriteriaSort.builder(property).direction(direction).build());
    }

    public <T> Criteria pageList(PagedList<T> pagedList){
        this.pagedList=pagedList;
        return this;
    }

    public Criteria pageBean(PageBean pageBean){
        this.pageBean=pageBean;
        return this;
    }

    public Criteria add_left_join_fetch(String property){
        left_join_fetch_s.add(property);
        return this;
    }

    public Criteria add_group_by(String property){
        groupBys.add(new CriteriaGroupBy(property));
        return this;
    }

}
