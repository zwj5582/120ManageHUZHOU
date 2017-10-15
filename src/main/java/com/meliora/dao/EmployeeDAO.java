/*
 * Created by ZhongWenjie on 2017-09-27 13:35.
 */

package com.meliora.dao;

import com.meliora.dao.repository.BaseRepository;
import com.meliora.model.Employee;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeDAO extends BaseRepository<Employee,Integer> {

    @Query(value = "from Employee e " +
            "join fetch e.account " +
            "left join fetch e.CPositionType " +
            "left join fetch e.departmentByDepartmentId " +
            "where e.account.id = ?1")
    Employee findByAccountId(Integer accountId);

}
