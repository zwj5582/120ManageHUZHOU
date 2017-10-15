/*
 *  Created by ZhongWenjie on 2017-10-05 18:13
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.Department;
import org.springframework.stereotype.Repository;


@Repository
public interface DepartmentDAO extends BaseRepository<Department,Integer> {

}
