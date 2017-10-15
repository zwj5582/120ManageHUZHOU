/*
 *  Created by ZhongWenjie on 2017-10-03 18:37
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.AccountRole;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRoleDAO extends BaseRepository<AccountRole,Integer> {
}
