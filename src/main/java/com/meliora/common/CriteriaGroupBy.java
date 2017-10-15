/*
 *  Created by ZhongWenjie on 2017-10-05 17:52
 */

package com.meliora.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;
import org.springframework.validation.annotation.Validated;

@Data
@Validated
@AllArgsConstructor
public class CriteriaGroupBy {

    @NonNull
    private String property;

}
