/*
 *  Created by ZhongWenjie on 2017-09-24 0:12
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.Account;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

@Component
public interface AccountDAO extends BaseRepository<Account,Integer> {

    Account findByUsername( String username);

}
