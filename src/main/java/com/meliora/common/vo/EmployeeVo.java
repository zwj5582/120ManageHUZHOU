/*
 *  Created by ZhongWenjie on 2017-10-06 14:00
 */

package com.meliora.common.vo;

import lombok.Data;

import java.util.Date;

@Data
public class EmployeeVo{

    public EmployeeVo(){}

    private Integer age;

    private String vocationType;

    private Date beginTime;

    private Date endTime;

}
