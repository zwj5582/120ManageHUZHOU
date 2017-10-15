/*
 *  Created by ZhongWenjie on 2017-10-05 17:21
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.HolidaysType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HolidaysTypeDAO extends BaseRepository<HolidaysType ,Integer> {

    @Query(value = "from HolidaysType model where model.deleted = 0")
    List<HolidaysType> findAll();

}
