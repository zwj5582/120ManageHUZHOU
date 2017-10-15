/*
 *  Created by ZhongWenjie on 2017-10-05 17:19
 */

package com.meliora.service.impl;

import com.meliora.common.*;
import com.meliora.dao.*;
import com.meliora.model.*;
import com.meliora.service.EmployeeService;
import com.meliora.util.SecurityUtils;
import com.meliora.util.SessionUtils;
import com.meliora.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private HolidaysTypeDAO holidaysTypeDAO;

    @Autowired
    private EmployeeDAO employeeDAO;

    @Autowired
    private DepartmentDAO departmentDAO;

    @Autowired
    private CJobTypeDAO cJobTypeDAO;

    @Autowired
    private CPositionTypeDAO cPositionTypeDAO;

    @Autowired
    private AppointPostDAO appointPostDAO;

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private RegularSalaryDAO regularSalaryDAO;

    @Autowired
    private IrregularSalaryDAO irregularSalaryDAO;

    @Autowired
    private OperationLogDAO operationLogDAO;

    @Autowired
    private ScheduleAccountDAO scheduleAccountDAO;

    @Override
    public List<HolidaysType> getHolidaysType() {
        return holidaysTypeDAO.findAll();
    }

    @Override
    public List<Employee> findEmployees(Map<String, Object> map) {
        Calendar now = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Criteria criteria = new Criteria()
                .add_left_join_fetch("model.CPositionType")
                .add_left_join_fetch("model.departmentByDepartmentId")
                .add_left_join_fetch("model.account")
                .add_left_join_fetch("model.holidayses holidays")
                .add_left_join_fetch("holidays.holidaysType")
                .add_left_join_fetch("holidays.holidaysRecords records");
        if (Util.valid(map.get("vocationType")) || Util.valid(map.get("beginTime")) && Util.valid(map.get("endTime"))){
            criteria.addFilter("holidays.id","records.holidays.id", CriteriaType.INT);
            if (Util.valid(map.get("vocationType"))){
                criteria.addFilter("holidays.holidaysType.id",map.get("vocationType"),CriteriaType.STRING);
                map.remove("vocationType");
            }

            if (Util.valid(map.get("beginTime")) && Util.valid(map.get("endTime"))){
                criteria.addFilter("date_format(records.startTime, '%Y-%m-%d')",map.get("beginTime"),CriteriaType.DATE,"yyyy-MM-dd", Operation.MORE_THAN_OR_EQUAL)
                        .addFilter("date_format(records.endTime, '%Y-%m-%d')",map.get("endTime"),CriteriaType.DATE,"yyyy-MM-dd", Operation.LESS_THAN_OR_EQUAL);
                map.remove("beginTime");
                map.remove("endTime");
            }
        }

        if("dimission".equals(map.get("CEmployeeState")) ){
            criteria.addFilter("model.CEmployeeState.id","dimission",CriteriaType.STRING);
            map.remove("CEmployeeState");
        }else if("retire".equals(map.get("CEmployeeState")) ){
            criteria.addFilter("model.CEmployeeState.id","retire",CriteriaType.STRING);
            map.remove("CEmployeeState");
        } else{
            criteria.addFilter("model.CEmployeeState.id","enabled",CriteriaType.STRING);
            map.remove("CEmployeeState");
        }
        Iterator<String> it = map.keySet().iterator();
        while(it.hasNext()){
            String key = it.next();
            if(map.get(key)!=null){
                if("name".equals(key)){
                    criteria.addOr(
                            CriteriaOR.or()
                                    .addFilter("model.name",map.get(key),CriteriaType.STRING,Operation.__LIKE__)
                                    .addFilter("model.pinyinShort",map.get(key),CriteriaType.STRING,Operation.__LIKE__)
                    );
                }
                else if("education".equals(key)||"jobPosition".equals(key)){
                    criteria.addFilter("model."+key,map.get(key),CriteriaType.STRING);
                }
                else if("age".equals(key)){
                    int age1=Integer.parseInt(map.get(key).toString().split("-")[0]);
                    int age2=Integer.parseInt(map.get(key).toString().split("-")[1]);
                    now.add(Calendar.DAY_OF_YEAR,-(365*age1));
                    String date1 =  formatter.format(now.getTime());

                    now.add(Calendar.DAY_OF_YEAR,-(365*age2));
                    String date2 =  formatter.format(now.getTime());
                    criteria.addFilter("model.borndate",date2,CriteriaType.STRING, Operation.MORE_THAN_OR_EQUAL)
                            .addFilter("model.borndate",date1,CriteriaType.STRING, Operation.LESS_THAN_OR_EQUAL);
                }
                else{
                    criteria.addFilter("model."+key,map.get(key),CriteriaType.INT);
                }
            }
        }

        criteria.add_group_by("model.id")
                .addSort("model.jobnumber");
        return employeeDAO.findByCriteria(criteria);
    }

    @Override
    public List<Department> findSection() {
        Criteria criteria = new Criteria()
                .addFilter("model.CDepartmentType.id","section",CriteriaType.STRING)
                .addSort("substring(model.name,1,2)");
        return departmentDAO.findByCriteria(criteria);
    }

    @Override
    public List<Department> findBranch() {
        String queryString = "from Department model where model.CDepartmentType.id in ('branch','subbranch')" +
                "  order by substring(model.name,1,2) ";
        return departmentDAO.findByQueryString(queryString);
    }

    @Override
    public Employee findOne(Integer id) {
        return employeeDAO.findOne(id);
    }

    @Override
    public List<CJobType> findJobType() {
        return (List<CJobType>)cJobTypeDAO.findAll();
    }

    @Override
    public List<CPositionType> findPositionType() {
        return (List<CPositionType>)cPositionTypeDAO.findAll();
    }

    @Override
    public List<AppointPost> findAllAppointPost() {
        return (List<AppointPost>)appointPostDAO.findAll();
    }

    @Override
    public Employee saveEmployee(Account account, Employee employee, RegularSalary regularSalary, IrregularSalary irregularSalary) {
        CAccountType accountType = new CAccountType();
        accountType.setId($.ACCOUNT_TYPE_EMPLOYEE);
        account.setCAccountType(accountType);
        account.setState($.ACCOUNT_STATE_ENABLED);
        account.setDomainId(1);
        account.setPassword(SecurityUtils.MD5(account.getPassword()));
        accountDAO.save(account);
        // 添加人员
        if (employee.getCJobType() == null
                || employee.getCJobType().getId() == null
                || "".equals(employee.getCJobType().getId())) {
            employee.setCJobType(null);
        } else {
            if ("nurse".equals(employee.getCJobType().getId())
                    || "doctor".equals(employee.getCJobType().getId())) {
                employee.setEmrType(employee.getCJobType().getId());
            }
        }
        employee.setAccount(account);
        CEmployeeState employeeState = new CEmployeeState();
        employeeState.setId($.EMPLOYEE_STATE_ENABLED);
        employee.setCEmployeeState(employeeState);
        if (employee.getCPositionType() == null
                || employee.getCPositionType().getId() == null
                || "".equals(employee.getCPositionType().getId())) {
            employee.setCPositionType(null);
        }
        if (employee.getAppointPost() == null
                || employee.getAppointPost().getId() == null
                || "".equals(employee.getAppointPost().getId())) {
            employee.setAppointPost(null);
        }
        if (employee.getDepartmentByBranchId() == null
                || employee.getDepartmentByBranchId().getId() == 0) {
            employee.setDepartmentByBranchId(null);
        }
        if (employee.getDepartmentByDepartmentId() == null
                || employee.getDepartmentByDepartmentId().getId() == 0) {
            employee.setDepartmentByDepartmentId(null);
        }
        employeeDAO.save(employee);
        if (1 == employee.getIsRegular()) {
            regularSalary.setEmployee(employee);
            regularSalaryDAO.save(regularSalary);
        } else {
            irregularSalary.setEmployee(employee);
            irregularSalaryDAO.save(irregularSalary);
        }

        // 员工操作日志记录
        OperationLog log = new OperationLog();
        log.setAccountId(SessionUtils.getAccountId());// 登录操作人
        Employee login_employee = employeeDAO.findByAccountId(SessionUtils.getAccountId());
        if (login_employee != null) {
            log.setName(login_employee.getName());
        } else {
            log.setName("管理员");
        }
        log.setModifyTime(new Date());// 时间
        log.setChangeTime(new Date());// 时间
        log.setType("入职");
        log.setClient("web");
        String desc = "";
        if (employee.getDepartmentByDepartmentId() != null
                && employee.getDepartmentByDepartmentId().getId() > 0) {
            Department d = departmentDAO.findOne(employee
                    .getDepartmentByDepartmentId().getId());
            desc = "【入职】姓名：" + employee.getName() + ",被分配到部门:" + d.getName();
        } else {
            desc = "【入职】姓名：" + employee.getName();
        }
        log.setDescription(desc);// 日志描述
        operationLogDAO.save(log);

        return employee;
    }

    @Override
    public boolean validataJobnumber(String jobnumber) {
        Employee employee = employeeDAO.findOneByCriteria(
                new Criteria()
                        .addFilter("model.jobnumber",jobnumber,CriteriaType.STRING)
                        .addFilter("model.CEmployeeState.id",$.EMPLOYEE_STATE_ENABLED,CriteriaType.STRING)
        );
        return Util.valid(employee);
    }

    @Override
    public boolean validataUsername(String username) {
        Account account = accountDAO.findOneByCriteria(
                new Criteria()
                    .addFilter("model.username",username,CriteriaType.STRING)
        );
        return Util.valid(account);
    }

    @Override
    public boolean validataisTimecard(String timecard) {
        Employee employee = employeeDAO.findOneByCriteria(
                new Criteria()
                    .addFilter("model.timecard",timecard,CriteriaType.STRING)
        );
        return Util.valid(employee);
    }

    @Override
    public RegularSalary getEmployeeRegularSalary(Integer id) {
        return regularSalaryDAO.findOneByCriteria(
                new Criteria()
                    .addFilter("model.employee.id",id,CriteriaType.INT)
        );
    }

    @Override
    public IrregularSalary getEmployeeIrregularSalary(Integer id) {
        return irregularSalaryDAO.findOneByCriteria(
                new Criteria()
                    .addFilter("model.employee.id",id,CriteriaType.INT)
        );
    }

    @Override
    public void updateEmployee(Employee employee, RegularSalary regularSalary, IrregularSalary irregularSalary) {
        Employee e = employeeDAO.findOne(employee.getId());
        if (!employee.getName().equals(e.getName())) {
            scheduleAccountDAO.updateDisplayName(e.getAccount().getId(),
                    employee.getName(), new Date());
            e.setName(employee.getName());
        }
        e.setJobnumber(employee.getJobnumber());
        e.setTimecard(employee.getTimecard());
        e.setSex(employee.getSex());

        if (!"".equals(employee.getCJobType().getId())) {
            e.setCJobType(employee.getCJobType());
            if ("nurse".equals(employee.getCJobType().getId())
                    || "doctor".equals(employee.getCJobType().getId())) {
                e.setEmrType(employee.getCJobType().getId());
            }
        } else {
            e.setCJobType(null);
        }
        if (!"".equals(employee.getCPositionType().getId())) {
            e.setCPositionType(employee.getCPositionType());
        } else {
            e.setCPositionType(null);
        }

        e.setJobPosition(employee.getJobPosition());
        e.setPinyinShort(employee.getPinyinShort());
        e.setBorndate(employee.getBorndate());
        e.setIsRegular(employee.getIsRegular());
        e.setIdcard(employee.getIdcard());
        e.setNativePlace(employee.getNativePlace());
        e.setNationality(employee.getNationality());
        e.setPoliticalAffiliation(employee.getPoliticalAffiliation());
        e.setJobBegin(employee.getJobBegin());
        e.setJoinParty(employee.getJoinParty());
        e.setEducation(employee.getEducation());
        e.setDegree(employee.getDegree());
        e.setMajor(employee.getMajor());
        e.setGraduation(employee.getGraduation());
        e.setSchool(employee.getSchool());
        e.setJoinDate(employee.getJoinDate());
        e.setJoinWay(employee.getJoinWay());
        e.setIsRefer(employee.getIsRefer());
        e.setPost(employee.getPost());
        e.setPostGrade(employee.getPostGrade());
        e.setJobTitle(employee.getJobTitle());
        e.setPresentJob(employee.getPresentJob());
        e.setIncludeNumber(employee.getIncludeNumber());
        e.setIncludeDate(employee.getIncludeDate());
        e.setSheetNumber(employee.getSheetNumber());
        e.setIncludeFund(employee.getIncludeFund());
        e.setDrivingLicense(employee.getDrivingLicense());
        e.setLicenseDate(employee.getLicenseDate());
        e.setLicenseModel(employee.getLicenseModel());
        e.setWorkPhone(employee.getWorkPhone());
        e.setHomePhone(employee.getHomePhone());
        e.setMobile(employee.getMobile());
        e.setEmail(employee.getEmail());
        e.setPostcode(employee.getPostcode());
        e.setAddress(employee.getAddress());
        e.setComments(employee.getComments());
        e.setPermanentResidenceAddress(employee.getPermanentResidenceAddress());
        e.setEmergencyContactPerson(employee.getEmergencyContactPerson());
        e.setEmergencyContactRelation(employee.getEmergencyContactRelation());
        e.setEmergencyContactPhone(employee.getEmergencyContactPhone());

        if (Util.valid(employee.getAppointPost().getId())) {
            e.setAppointPost(employee.getAppointPost());
        } else {
            e.setAppointPost(null);
        }



        // 员工操作日志记录
        Employee em = employeeDAO.findOne(employee.getId());
        int old = em.getDepartmentByDepartmentId().getId();
        int oldBranch = Util.valid(em.getDepartmentByBranchId()) ? em.getDepartmentByBranchId().getId() : 0;
        OperationLog log = new OperationLog();
        log.setDeptIdFrom(old);
        log.setBranchIdFrom(oldBranch);
        log.setChangeUserName(em.getAccount().getUsername());
        String desc = null;
        boolean flag = false;
        if(Util.valid(employee.getDepartmentByDepartmentId())){
            int news = employee.getDepartmentByDepartmentId().getId();
            if (em.getDepartmentByDepartmentId() != null) {
                if (news != old) {
                    flag = true;
                    log.setDeptIdTo(news);
                    log.setType("部门调动");
                    desc = "【部门调动】部门:"+ em.getDepartmentByDepartmentId().getName()
                            + ",姓名：" + employee.getName() + ", 被调入到"
                            + departmentDAO.findOne(news).getName();
                }
            }
            e.setDepartmentByDepartmentId(employee.getDepartmentByDepartmentId());
        }else{
            e.setDepartmentByDepartmentId(null);
        }

        if(Util.valid(employee.getDepartmentByBranchId()) && employee.getDepartmentByBranchId().getId()>0){
            int newsBranch = employee.getDepartmentByBranchId().getId();
            if (em.getDepartmentByBranchId() != null) {
                if (newsBranch != oldBranch) {
                    flag = true;
                    log.setBranchIdTo(newsBranch);
                    if(Util.valid(log.getType())){
                        log.setType(log.getType()+"和分站调动");
                    }else{
                        log.setType("分站调动");
                    }
                    if(Util.valid(log.getDescription())){
                        desc = log.getDescription()+ ";【分站调动】分站:"+ em.getDepartmentByBranchId().getName()
                                + ",姓名：" + employee.getName() + ", 被调入到"
                                + departmentDAO.findOne(newsBranch).getName();
                    }else{
                        desc =  "【分站调动】分站:"+ em.getDepartmentByBranchId().getName()
                                + ",姓名：" + employee.getName() + ", 被调入到"
                                + departmentDAO.findOne(newsBranch).getName();
                    }
                }
            }
            e.setDepartmentByBranchId(employee.getDepartmentByBranchId());
        }else{
            e.setDepartmentByBranchId(null);
        }
        if(flag){
            Employee login_employee = employeeDAO.findByAccountId(SessionUtils.getAccountId());
            if (login_employee != null) {
                log.setName(login_employee.getName());
            } else {
                log.setName("管理员");
            }
            log.setClient("web");
            log.setChangeTime(new Date());
            log.setAccountId(SessionUtils.getAccountId());//
            log.setModifyTime(new Date());// 修改时间
            log.setDescription(desc);// 日志描述
            operationLogDAO.save(log);
        }
        if (1 == employee.getIsRegular()) {
            RegularSalary dbRegularSalary = regularSalaryDAO.findOneByCriteria(
                    new Criteria()
                        .addFilter("model.employee.id",employee.getId(),CriteriaType.INT)
            );
            if (dbRegularSalary == null) {
                regularSalary.setEmployee(employee);
                regularSalaryDAO.save(regularSalary);
            } else {
                dbRegularSalary.setSalary1(regularSalary.getSalary1());
                dbRegularSalary.setSalary2(regularSalary.getSalary2());
                dbRegularSalary.setSalary3(regularSalary.getSalary3());
                dbRegularSalary.setSalary4(regularSalary.getSalary4());
                dbRegularSalary.setSalary5(regularSalary.getSalary5());
                dbRegularSalary.setSalary6(regularSalary.getSalary6());
                dbRegularSalary.setSalary7(regularSalary.getSalary7());
                dbRegularSalary.setSalary8(regularSalary.getSalary8());
                dbRegularSalary.setSalary9(regularSalary.getSalary9());
                dbRegularSalary.setSalary10(regularSalary.getSalary10());
                dbRegularSalary.setSalary11(regularSalary.getSalary11());
                dbRegularSalary.setSalary12(regularSalary.getSalary12());
                dbRegularSalary.setSalary13(regularSalary.getSalary13());
                dbRegularSalary.setSalary14(regularSalary.getSalary14());
                dbRegularSalary.setSalary15(regularSalary.getSalary15());
                dbRegularSalary.setSalary16(regularSalary.getSalary16());
                dbRegularSalary.setDeduction1(regularSalary.getDeduction1());
                dbRegularSalary.setDeduction2(regularSalary.getDeduction2());
                dbRegularSalary.setDeduction3(regularSalary.getDeduction3());
                dbRegularSalary.setDeduction4(regularSalary.getDeduction4());
                dbRegularSalary.setDeduction5(regularSalary.getDeduction5());
                dbRegularSalary.setDeduction6(regularSalary.getDeduction6());
                dbRegularSalary.setDeduction7(regularSalary.getDeduction7());
            }
        } else {
            IrregularSalary dbIrregularSalary = irregularSalaryDAO.findOneByCriteria(
                            new Criteria()
                                    .addFilter("model.employee.id",employee.getId(),CriteriaType.INT)
                    );
            if (dbIrregularSalary == null) {
                irregularSalary.setEmployee(employee);
                irregularSalaryDAO.save(irregularSalary);
            } else {
                dbIrregularSalary.setSalary1(irregularSalary.getSalary1());
                dbIrregularSalary.setSalary3(irregularSalary.getSalary3());
                dbIrregularSalary
                        .setDeduction1(irregularSalary.getDeduction1());
                dbIrregularSalary
                        .setDeduction2(irregularSalary.getDeduction2());
                dbIrregularSalary
                        .setDeduction3(irregularSalary.getDeduction3());
                dbIrregularSalary
                        .setDeduction4(irregularSalary.getDeduction4());
            }
        }
    }
}
