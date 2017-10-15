/*
 *  Created by ZhongWenjie on 2017-10-07 21:32
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.IrregularSalary;
import org.springframework.stereotype.Repository;

@Repository
public interface IrregularSalaryDAO extends BaseRepository<IrregularSalary,Integer> {
}
