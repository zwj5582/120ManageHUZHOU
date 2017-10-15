/*
 *  Created by ZhongWenjie on 2017-10-07 21:31
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.RegularSalary;
import org.springframework.stereotype.Repository;

@Repository
public interface RegularSalaryDAO extends BaseRepository<RegularSalary,Integer> {

}
