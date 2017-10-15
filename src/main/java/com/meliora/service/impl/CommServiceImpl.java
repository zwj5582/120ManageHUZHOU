/*
 *  Created by ZhongWenjie on 2017-10-03 19:03
 */

package com.meliora.service.impl;

import com.meliora.common.$;
import com.meliora.dao.AccountDAO;
import com.meliora.dao.MenuDAO;
import com.meliora.model.Account;
import com.meliora.model.Menu;
import com.meliora.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CommServiceImpl implements CommonService {

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private MenuDAO menuDAO;

    @Override
    public List<Menu> getUserMenus(Integer accountId) {
        Account account = accountDAO.findOne(accountId);
        List<Menu> menuList;
        if ($.ACCOUNT_TYPE_ADMIN.equals(account.getCAccountType().getId())) {
            menuList = (List<Menu>) menuDAO.findAll();
        } else {
            menuList = menuDAO.findMenuByAccountId(accountId);
            //多级目录临时解决方案
            List<Integer> ids = new ArrayList<Integer>();
            for(Menu menu : menuList){
                if(menu.getMenu() != null){
                    ids.add(menu.getId());
                }
            }
            if(ids.size()>0){
                List<Menu> menuList1 = menuDAO.findByParentIds(ids);
                menuList.addAll(menuList1);
                List<Integer> ids2 = new ArrayList<Integer>();
                for(Menu menu : menuList1){
                    ids2.add(menu.getId());
                }
                if(ids2.size()>0){
                    List<Menu> menuList2 = menuDAO.findByParentIds(ids2);
                    menuList.addAll(menuList2);
                    List<Integer> ids3 = new ArrayList<Integer>();
                    for(Menu menu : menuList2){
                        ids3.add(menu.getId());
                    }
                    if (ids3.size()>0){
                        List<Menu> menuList3 = menuDAO.findByParentIds(ids3);
                        menuList.addAll(menuList3);
                        List<Integer> ids4 = new ArrayList<Integer>();
                        for(Menu menu : menuList3){
                            ids4.add(menu.getId());
                        }
                        if (ids4.size()>0){
                            List<Menu> menuList4 = menuDAO.findByParentIds(ids4);
                            menuList.addAll(menuList4);
                            List<Integer> ids5 = new ArrayList<Integer>();
                            for(Menu menu : menuList4){
                                ids5.add(menu.getId());
                            }
                            if (ids5.size()>0){
                                List<Menu> menuList5 = menuDAO.findByParentIds(ids5);
                                menuList.addAll(menuList5);
                            }
                        }
                    }
                }

            }

        }
        return menuList;
    }
}
