/*
 *  Created by ZhongWenjie on 2017-10-06 16:00
 */

package com.meliora.util;

import com.meliora.common.CriteriaFilter;
import com.meliora.common.CriteriaType;
import com.meliora.common.Operation;

import java.util.Date;

public class CriteriaUtils {

    private CriteriaUtils(){}

    public static CriteriaFilter.CriteriaFilterBuilder
        createCriteriaFilterBuilder(String property, Object value, Object... conditions){
        CriteriaFilter.CriteriaFilterBuilder builder = CriteriaFilter.builder(property, value);
        if (conditions!=null && conditions.length > 0 ){
            for (Object obj : conditions){
                if (obj instanceof CriteriaType)
                    builder.type((CriteriaType) obj);
                else if (obj instanceof Operation)
                    builder.operation((Operation) obj);
                else if (obj instanceof String)
                    builder.format((String) obj);
            }
        }
        return builder;
    }

    public static String parsePerCriteraFilter(String queryString,String joinType,CriteriaFilter filter){
        queryString += " "+joinType+" "+filter.getProperty()+" ";
        Operation operation = filter.getOperation();
        switch (operation){
            case EQUAL:
                queryString += " = ";break;
            case LESS_THAN:
                queryString += " < ";break;
            case MORE_THAN:
                queryString += " > ";break;
            case LESS_THAN_OR_EQUAL:
                queryString += " <= ";break;
            case MORE_THAN_OR_EQUAL:
                queryString += " >= ";break;
            case __LIKE:
                queryString += " like '%"+filter.getValue()+"' ";break;
            case LIKE__:
                queryString += " like '"+filter.getValue()+"%' ";break;
            case __LIKE__:
                queryString += " like '%"+filter.getValue()+"%' ";break;
            default:
                break;
        }
        if (!operation.equals(Operation.__LIKE) &&
                !operation.equals(Operation.__LIKE__) &&
                !operation.equals(Operation.LIKE__)){
            CriteriaType type = filter.getType();
            if (type.equals(CriteriaType.STRING)){
                queryString += " '"+filter.getValue()+"' ";
            }else if (type.equals(CriteriaType.DATE)){
                queryString += " '"+ TimeUtil.getDateString3((Date)filter.getValue(),filter.getFormat())+"' ";
            }else {
                queryString += " "+ filter.getValue() +" ";
            }
        }
        return queryString;
    }

}
