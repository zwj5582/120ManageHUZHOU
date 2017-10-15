/*
 *  Created by ZhongWenjie on 2017-10-07 0:39
 */

package com.meliora.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONUtils {

    private JSONUtils(){}

    public static String object2JSON(Object obj) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(obj)
                .replaceAll("\"","'");
    }

    public static String object2JSON(ObjectMapper mapper,Object obj) throws JsonProcessingException {
        return mapper.writeValueAsString(obj)
                .replaceAll("\"","'");
    }

}
