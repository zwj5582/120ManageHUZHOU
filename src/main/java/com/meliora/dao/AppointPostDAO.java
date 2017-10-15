/*
 *  Created by ZhongWenjie on 2017-10-06 17:28
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.AppointPost;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointPostDAO extends BaseRepository<AppointPost,Integer> {
}
