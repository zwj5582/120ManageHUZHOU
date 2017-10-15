/*
 *  Created by ZhongWenjie on 2017-09-23 14:19
 */

package com.meliora.common;

import lombok.Data;
import lombok.NonNull;
import org.springframework.validation.annotation.Validated;

@Data
@Validated
public class CriteriaSort {

    private static final Direction DEFUALT_DIRECTION = Direction.ASC;

    @NonNull
    private String property;

    private Direction direction = DEFUALT_DIRECTION;

    private CriteriaSort(){}

    public static CriteriaSortBuilder builder(String property){
        return new CriteriaSortBuilder(property);
    }

    public static class CriteriaSortBuilder{

        private CriteriaSort criteriaSort;

        private CriteriaSortBuilder(){}

        private CriteriaSortBuilder(String property){
            criteriaSort = new CriteriaSort();
            criteriaSort.property=property;
        }

        public CriteriaSortBuilder direction(Direction direction){
            criteriaSort.direction=direction;
            return this;
        }

        public CriteriaSort build(){
            return this.criteriaSort;
        }

    }

    public enum Direction{
        ASC,
        DESC
    }


}
