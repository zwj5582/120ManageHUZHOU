package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class Department extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "parentId")
	@JsonIgnore
	private Department department;

	@ManyToOne
	@JoinColumn(name = "type")
	private CDepartmentType CDepartmentType;

	@ManyToOne
	@JoinColumn(name = "accountId")
	private Account account;

	@Column
	private String anchorId;

	@Column
	private String name;

	@Column
	private String number;

	@Column
	private String phone;

	@Column
	private String comments;

	@Column
	private Integer fileNumber;

	@OneToMany(mappedBy = "department",targetEntity = Department.class)
	@JsonIgnore
	private Set departments = new HashSet(0);

	/*@OneToMany(mappedBy = "shifts",targetEntity = Shifts.class)
	@JsonIgnore
	private Set shiftses = new HashSet(0);*/

	@OneToMany(mappedBy = "department",targetEntity = Schedule.class)
	@JsonIgnore
	private Set schedules = new HashSet(0);

	@OneToMany(mappedBy = "departmentByBranchId",targetEntity = Employee.class)
	@JsonIgnore
	private Set employeesForBranchId = new HashSet(0);

	@OneToMany(mappedBy = "departmentByDepartmentId",targetEntity = Employee.class)
	@JsonIgnore
	private Set employeesForDepartmentId = new HashSet(0);

	/*private Set feeFlows = new HashSet(0);
	private Set receiveContents = new HashSet(0);
	private Set vehiclesForDepartmentId = new HashSet(0);
	private Set articleStacks = new HashSet(0);
	private Set employeeAppraisalsForDepartmentId = new HashSet(0);
	private Set vehiclesForVDepartmentId = new HashSet(0);

	private Set tasks = new HashSet(0);
	private Set publishContentsForReceiveDepartmentId = new HashSet(0);

	private Set departmentChecks = new HashSet(0);
	private Set medicineRecords = new HashSet(0);
	private Set employeeAppraisalsForBranchId = new HashSet(0);
	private Set publishContentsForSendDepartmentId = new HashSet(0);

	private Set assetses = new HashSet(0);
	private Set articleStocks = new HashSet(0);

	private Set scheduleStats = new HashSet(0);
	private Set employeeChecks = new HashSet(0);
	*/

}