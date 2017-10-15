/*
 *  Created by ZhongWenjie on 2017-10-03 18:32
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.RoleMenu;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface RoleMenuDAO extends BaseRepository<RoleMenu,Integer> {

    @Query("FROM RoleMenu rm WHERE rm.role.id = ?1 ")
    Set<Integer> findByRoleId(Integer roleId);
}
