/*
 *  Created by ZhongWenjie on 2017-09-23 14:19
 */

package com.meliora.common;

import lombok.Data;
import lombok.NonNull;
import org.springframework.validation.annotation.Validated;

@Data
@Validated
public class CriteriaFilter {

    private static final String DEFAULT_FORMAT = "yyyy-MM-dd HH:mm:ss" ;

    private static final CriteriaType DEFAULT_TYPE = CriteriaType.STRING;

    private static final Operation DEFAULT_OPERATION = Operation.EQUAL;

    @NonNull
    private String property;

    @NonNull
    private Object value;

    private CriteriaType type = DEFAULT_TYPE ;

    private  Operation operation = DEFAULT_OPERATION ;

    private String format = DEFAULT_FORMAT;

    private CriteriaFilter(){}

    public static CriteriaFilterBuilder builder(String property,Object value){
        return new CriteriaFilterBuilder(property,value);
    }

    public static class CriteriaFilterBuilder{

        private CriteriaFilter criteriaFilter;

        private CriteriaFilterBuilder(){}

        private CriteriaFilterBuilder(String property,Object value){
            criteriaFilter = new CriteriaFilter();
            criteriaFilter.property=property;
            criteriaFilter.value=value;
        }

        public CriteriaFilterBuilder type(CriteriaType type){
            criteriaFilter.type=type;
            return this;
        }

        public CriteriaFilterBuilder operation(Operation operation){
            criteriaFilter.operation=operation;
            return this;
        }

        public CriteriaFilterBuilder format(String format){
            criteriaFilter.format=format;
            return this;
        }

        public CriteriaFilter build(){
            return this.criteriaFilter;
        }
    }

}
