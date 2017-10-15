/*
 *  Created by ZhongWenjie on 2017-10-05 17:05
 */

package com.meliora.service;

import com.meliora.model.*;

import java.util.List;
import java.util.Map;

public interface EmployeeService {

    List<HolidaysType> getHolidaysType();

    List<Employee> findEmployees(Map<String, Object> map);

    List<Department> findSection();

    List<Department> findBranch();

    Employee findOne(Integer id);

    List<CJobType> findJobType();

    List<CPositionType> findPositionType();

    List<AppointPost> findAllAppointPost();

    Employee saveEmployee(Account account, Employee emp, RegularSalary regularSalary, IrregularSalary irregularSalary);

    boolean validataJobnumber(String jobnumber);

    boolean validataUsername(String username);

    boolean validataisTimecard(String timecard);

    RegularSalary getEmployeeRegularSalary(Integer id);

    IrregularSalary getEmployeeIrregularSalary(Integer id);

    void updateEmployee(Employee employee, RegularSalary regularSalary, IrregularSalary irregularSalary);
}
