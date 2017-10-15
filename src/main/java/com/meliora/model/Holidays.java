package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Holidays entity. @author MyEclipse Persistence Tools
 */

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class Holidays extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "employeeId")
	private Employee employee;

	@ManyToOne
	@JoinColumn(name = "departmentId")
	private Department department;

	@ManyToOne
	@JoinColumn(name = "holidaysTypeId")
	private HolidaysType holidaysType;

	@Column
	private Date year;

	@Column
	private Integer allHolidays;

	@Column
	private Integer remainHolidays;

	@Column
	private String remarks;

	@OneToMany(mappedBy = "holidays",targetEntity = HolidaysRecord.class)
	private Set holidaysRecords = new HashSet(0);
}