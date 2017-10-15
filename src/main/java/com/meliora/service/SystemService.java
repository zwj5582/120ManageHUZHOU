package com.meliora.service;


import com.meliora.model.Account;
import com.meliora.model.Employee;

import java.util.Map;

public interface SystemService {

    void initCache();

    Account findByUsername(String username);

    Account findByUsername2(String username);

    Account getAccountByJobnumber(String username);

    Employee getEmployeeByAcctionId(Integer id);

    Map<String, Object> getEmployeeInfo();

}
