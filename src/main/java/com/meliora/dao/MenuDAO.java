/*
 *  Created by ZhongWenjie on 2017-10-03 18:16
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.Menu;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDAO extends BaseRepository<Menu,Integer> {

    @Query(
            "From Menu as model where model.id in " +
                    "(select rm.menu.id from RoleMenu as rm where rm.role.id in " +
                    "(select ar.role.id from AccountRole ar where ar.account.id= ?1 )" +
                    ")"
                    )
    List<Menu> findMenuByAccountId(Integer accountId);


    @Query("from Menu as model where model.menu.id in (:ids)")
    List<Menu> findByParentIds(@Param(value = "ids") List<Integer> ids);

}
