/*
 *  Created by ZhongWenjie on 2017-10-05 16:55
 */

package com.meliora.controller;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonAppend;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.meliora.common.PageBean;
import com.meliora.common.vo.EmployeeVo;
import com.meliora.model.*;
import com.meliora.util.JSONUtils;
import com.meliora.util.SpringUtils;
import com.meliora.util.Util;
import jdk.nashorn.internal.ir.debug.JSONWriter;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class EmployeeController extends BaseController {

    @RequestMapping(value = "/employee")
    public String employee(Employee employee, EmployeeVo employeeVo, PageBean pagebean, Model model){
        Map<String,Object> map = new HashMap<>();
        if (employee != null) {
            map.put("name", (employee.getName()!=null)?employee.getName().trim():null);
            map.put("departmentByDepartmentId.id", (employee.getDepartmentByDepartmentId()!=null) ? employee.getDepartmentByDepartmentId().getId() : null);
            map.put("departmentByBranchId.id", (Util.valid(employee.getDepartmentByBranchId()))?employee.getDepartmentByBranchId().getId():null);
            map.put("isRegular", employee.getIsRegular());
            map.put("education", employee.getEducation());
            map.put("jobPosition", employee.getJobPosition());
            map.put("CEmployeeState", (Util.valid(employee.getCEmployeeState()))?employee.getCEmployeeState().getId():null);
        }
        if(Util.valid(employeeVo.getAge())){
            map.put("age", employeeVo.getAge());
        }

        Iterator<String> it = map.keySet().iterator();
        while (it.hasNext()) {
            String key = it.next();
            if (map.get(key) == null || "".equals(map.get(key))) {
                it.remove();
                map.remove(key);
            }
        }

        if (Util.valid(employeeVo.getVocationType())){
            map.put("vocationType", employeeVo.getVocationType());
        }
        if (Util.valid(employeeVo.getBeginTime())){
            map.put("beginTime", employeeVo.getBeginTime());
        }
        if (Util.valid(employeeVo.getEndTime())){
            map.put("endTime", employeeVo.getEndTime());
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("holidaysTypes",employeeService.getHolidaysType());
        List<Employee> employeeList = employeeService.findEmployees(map);
        List<Employee> list = new ArrayList<Employee>();
        int currentPage = pagebean.getCurrentPage();
        int pageSize = pagebean.getPageSize();
        int totalPage = pagebean.getTotalPage();
        int totalRow = pagebean.getTotalRow();
        int beginIndex = ((currentPage - 1) == 0 ? 0 : (currentPage - 1)) * pageSize;
        int endIndex = currentPage * pageSize;
        if (Util.valid(employeeList)){
            pagebean.setTotalRow(employeeList.size());
            for (int i = 0; i < employeeList.size(); ++i){
                if (i >= beginIndex && i < endIndex){
                    list.add(employeeList.get(i));
                }
            }
            pagebean.setList(list);
        }
        model.addAttribute("pagebean",pagebean);
        model.addAttribute("sectionlist",employeeService.findSection());
        model.addAttribute("branchlist",employeeService.findBranch());
        return "employee/employeeList";
    }

    @GetMapping(value = "/employee/view/{id}")
    public String view(@PathVariable Integer id,Model model){
        model.addAttribute("employee",employeeService.findOne(id));
        return "employee/employeeDetail";
    }

    @GetMapping(value = "/employee/add")
    public String add(Model model) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        model.addAttribute("sectionlist", JSONUtils.object2JSON(mapper,employeeService.findSection()));
        model.addAttribute("branchlist", JSONUtils.object2JSON(mapper,employeeService.findBranch()));
        model.addAttribute("jobTypeList",JSONUtils.object2JSON(mapper,employeeService.findJobType()));
        model.addAttribute("positionTypeList",JSONUtils.object2JSON(mapper,employeeService.findPositionType()));
        model.addAttribute("appointPostList",JSONUtils.object2JSON(mapper,employeeService.findAllAppointPost()));
        return "employee/employeeAdd";
    }

    @PostMapping(value = "/employee/add")
    public String addEmployee(@ModelAttribute("account") Account account, Employee emp , RegularSalary regularSalary, IrregularSalary irregularSalary, Model model){
        model.addAttribute("emp",employeeService.saveEmployee(account,emp,regularSalary,irregularSalary));
        model.addAttribute("isFlag","success");
        return redirect("/employee");
    }

    @PostMapping(value = "/employee/valid/{methodName}/{param}")
    public ResponseEntity<String> isValidata(@PathVariable String methodName,@PathVariable String param){
        Method method = ReflectionUtils.findMethod(employeeService.getClass(), methodName, String.class);
        boolean valid = (Boolean)ReflectionUtils.invokeMethod(method, employeeService, param);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.TEXT_PLAIN);
        return new ResponseEntity<>( ((valid) ? "1" : "0") ,headers ,HttpStatus.CREATED);
    }

    @GetMapping(value = "/employee/update/{id}")
    public String employeeUpdate(@PathVariable Integer id,Model model) throws JsonProcessingException {
        Employee employee = employeeService.findOne(id);
        model.addAttribute("employee",employee);
        if (employee.getIsRegular() != null) {
            if (1 == employee.getIsRegular()) {
                model.addAttribute("regularSalary",employeeService
                        .getEmployeeRegularSalary(employee.getId()));
            } else {
                model.addAttribute("irregularSalary",employeeService
                        .getEmployeeIrregularSalary(employee.getId()));
            }
        }
        ObjectMapper mapper = new ObjectMapper();
        model.addAttribute
                ("sectionlist",JSONUtils.object2JSON(mapper,employeeService.findSection()));
        model.addAttribute
                ("branchlist",JSONUtils.object2JSON(mapper,employeeService.findBranch()));
        model.addAttribute
                ("jobTypeList",JSONUtils.object2JSON(mapper,employeeService.findJobType()));
        model.addAttribute
                ("positionTypeList",JSONUtils.object2JSON(mapper,employeeService.findPositionType()));
        model.addAttribute
                ("appointPostList",JSONUtils.object2JSON(mapper,employeeService.findAllAppointPost()));
        return "employee/employeeUpdate";
    }

    @PostMapping(value = "/employee/update")
    public String update(Employee employee,RegularSalary regularSalary,IrregularSalary irregularSalary){
        employeeService.updateEmployee(employee,regularSalary,irregularSalary);
        return redirect("/employee");
    }

}
