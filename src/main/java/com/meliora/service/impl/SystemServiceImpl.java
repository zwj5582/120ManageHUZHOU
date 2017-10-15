package com.meliora.service.impl;


import com.google.common.collect.Maps;
import com.meliora.common.$;
import com.meliora.common.Criteria;
import com.meliora.common.CriteriaType;
import com.meliora.common.Operation;
import com.meliora.dao.AccountDAO;
import com.meliora.dao.AccountRoleDAO;
import com.meliora.dao.EmployeeDAO;
import com.meliora.dao.MenuDAO;
import com.meliora.model.*;
import com.meliora.service.SystemService;
import com.meliora.util.SessionUtils;
import com.meliora.util.Util;
import com.meliora.util.cache.DefaultCacheLoader;
import com.meliora.util.cache.DefaultCachePool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;


@Service
@Transactional
@SuppressWarnings("unchecked")
public class SystemServiceImpl implements SystemService {

    @Autowired
    private DefaultCachePool cachePool;

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private EmployeeDAO employeeDAO;

    @Autowired
    private MenuDAO menuDAO;

    @Autowired
    private AccountRoleDAO accountRoleDAO;

    @Override
    public void initCache() {
        cachePool.putCache($.CACHE_ACCOUNT,new DefaultCacheLoader<String,Account>
                ("accountDAO","findByUsername"));

        cachePool.putCache($.CAHCE_MENU,new DefaultCacheLoader<Integer,Menu>
                ("menuDAO","findById"));

        cachePool.putCache($.CAHCE_ROLE_MENU,new DefaultCacheLoader<Integer,Set<Integer>>
                ("roleMenuDAO","findByRoleId"));
    }

    @Override
    public Account findByUsername(String username) {
        return (Account) cachePool.get($.CACHE_ACCOUNT,username);
    }

    @Override
    public Account findByUsername2(String username) {
        Criteria criteria = new Criteria();
        criteria.addFilter("model.username",username,Operation.EQUAL);
        return accountDAO.findOneByCriteria(criteria);
    }

    @Override
    public Account getAccountByJobnumber(String username) {
        Employee employee = employeeDAO.findOneByCriteria(new Criteria().addFilter("model.jobnumber", username));
        return (Util.valid(employee)) ? employee.getAccount() : null ;
    }

    @Override
    public Employee getEmployeeByAcctionId(Integer id) {
        return employeeDAO.findOneByCriteria(new Criteria().addFilter("model.account.id",id, CriteriaType.INT));
    }

    @Override
    public Map<String, Object> getEmployeeInfo() {
        List<AccountRole> accountRoles = null;
        Set<Menu> menus = new HashSet<>();
        if (SessionUtils.isAdmin()) {
            Set<Integer> ids = cachePool.getCachekeySet($.CAHCE_MENU);
            if (!Util.valid(ids) || ids.size() < 1) {
                setMenuToCache();
                ids = cachePool.getCachekeySet($.CAHCE_MENU);
            }
            for (Integer mid : ids) {
                Menu menu = (Menu) cachePool.get($.CAHCE_MENU, mid);
                if (Util.valid(menu)) {
                    menus.add(menu);
                }
            }
        } else {
            accountRoles = accountRoleDAO.findByCriteria(
                    new Criteria().addFilter("model.account.id",SessionUtils.getAccountId(),CriteriaType.INT));
            for (AccountRole accountRole : accountRoles) {
                int roleId = accountRole.getRole().getId();
                Set<Integer> mids = (Set<Integer>) cachePool.get($.CAHCE_ROLE_MENU, roleId);
                if (Util.valid(mids)) {
                    for (Integer mid : mids) {
                        Menu menu = (Menu) cachePool.get($.CAHCE_MENU, mid);
                        if (Util.valid(menu)) {
                            menus.add(menu);
                        }
                    }
                }

            }
        }
        Map<String, Object> data = Maps.newHashMap();
        data.put("menus", menus);
        return data;
    }

    private void setMenuToCache() {
        Iterable<Menu> menus = menuDAO.findAll();
        for (Menu menu : menus) {
            cachePool.put($.CAHCE_MENU, menu.getId(), menu);
        }
    }
}