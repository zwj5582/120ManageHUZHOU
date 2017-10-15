/*
 *  Created by ZhongWenjie on 2017-10-06 15:51
 */

package com.meliora.common;

import com.google.common.collect.Lists;
import com.meliora.util.CriteriaUtils;
import lombok.Data;

import java.util.List;

@Data
public class CriteriaOR {

    private List<CriteriaFilter> filters = Lists.newArrayList();

    private CriteriaOR(){}

    public static CriteriaOR or(){
        return new CriteriaOR();
    }

    public CriteriaOR addFilter(CriteriaFilter filter){
        filters.add(filter);
        return this;
    }

    public CriteriaOR addFilter(String property, Object value,Object... conditions){
        return addFilter
                (CriteriaUtils.createCriteriaFilterBuilder(property,value,conditions).build());
    }

}
