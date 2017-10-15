/*
 *  Created by ZhongWenjie on 2017-10-08 13:14
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.ScheduleAccount;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface ScheduleAccountDAO extends BaseRepository<ScheduleAccount,Integer> {

    @Modifying
    @Query(value = "update schedule_account model,schedule model1 " +
            "set model.display_name=?1 " +
            "where model.schedule_id=model1.id and model.account_id=?2 and model1.end_time>?3 ",nativeQuery = true)
    void updateDisplayName(Integer id, String name, Date date);
}
