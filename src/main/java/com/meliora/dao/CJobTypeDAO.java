/*
 *  Created by ZhongWenjie on 2017-10-06 17:22
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.CJobType;
import org.springframework.stereotype.Repository;

@Repository
public interface CJobTypeDAO extends BaseRepository<CJobType,String> {
}
