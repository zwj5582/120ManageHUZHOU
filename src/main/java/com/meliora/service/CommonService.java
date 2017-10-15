/*
 *  Created by ZhongWenjie on 2017-10-03 19:02
 */

package com.meliora.service;

import com.meliora.model.Menu;

import java.util.List;

public interface CommonService {

    List<Menu> getUserMenus(Integer accountId);

}
