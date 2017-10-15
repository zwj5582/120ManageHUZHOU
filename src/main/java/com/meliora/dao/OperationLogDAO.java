/*
 *  Created by ZhongWenjie on 2017-10-07 22:11
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.OperationLog;
import org.springframework.stereotype.Repository;

@Repository
public interface OperationLogDAO extends BaseRepository<OperationLog,Integer> {
}
