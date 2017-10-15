package com.meliora.util;

import com.meliora.common.$;
import com.meliora.model.Account;
import com.meliora.model.Employee;
import com.meliora.service.SystemService;

import javax.servlet.http.HttpSession;

public class SessionUtils {

    public static HttpSession getSession(){
        return RequestUtils.getRequest().getSession();
    }

    public static void setAttribute(String key ,Object val){
        getSession().setAttribute(key,val);
    }

    public static void put(String key ,Object val){
        getSession().setAttribute(key,val);
    }

    public static Object getAttribute(String key){
        return getSession().getAttribute(key);
    }

    public static String getUsername(){
        return (String) getSession().getAttribute($.USERNAME);
    }

    public static boolean isLogin(){
        return Util.valid(getUsername());
    }

    public static void login(Account account){
        SystemService systemService=(SystemService) SpringUtils.getBean(SystemService.class);
        put($.SESSION_USERID, account.getId());
        put($.USERNAME, account.getUsername());
        put($.SESSION_PASSWORD, account.getPassword());
        String name = account.getUsername();
        if (account.getCAccountType().getId().equals("employee")) {
            Employee employee = systemService.getEmployeeByAcctionId(account.getId());
            if (employee != null) {
                name = employee.getName();
                put($.SESSION_EMPLOYEEID, employee.getId());
                if(Util.valid(employee.getDepartmentByDepartmentId())){
                    put($.SESSION_DEPARTMENTID, employee.getDepartmentByDepartmentId().getId());
                }
                put($.SESSION_JOBPOSITION, employee.getJobPosition());
                if(Util.valid(employee.getCJobType())){
                    put($.SESSION_JOB, employee.getCJobType().getId());
                }
                put($.SESSION_DEPARTMENTNAME, employee.getDepartmentByDepartmentId().getName());
                if(employee.getCPositionType() != null)
                    put($.SESSION_POSITIONTYPE, employee.getCPositionType().getId());
                if(employee.getDepartmentByBranchId() != null){
                    put($.SESSION_BRANCHID, employee.getDepartmentByBranchId().getId());
                }
            }
        }
        put($.SESSION_NAME, name);
        setTheme("blue");
    }

    public static void logout(){
        getSession().invalidate();
    }

    public static boolean isAdmin() {
        return $.ACCOUNT_TYPE_ADMIN.equals(getUsername());
    }

    public static Integer getAccountId() {
        return (Integer) SessionUtils.getAttribute($.SESSION_USERID);
    }

    public static void setTheme(String theme) {
        put($.APPLICATION_THEME, theme);
    }
}
