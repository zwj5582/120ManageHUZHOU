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
 * Schedule entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Schedule extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "shiftId",nullable = false)
	private Shift shift;

	@ManyToOne
	@JoinColumn(name = "departmentId",nullable = false)
	private Department department;

	@Column(length = 32,nullable = false)
	private String name;

	@Column(length = 16,nullable = false)
	private String shiftType;

	@Column(length = 19,nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date beginTime;

	@Column(length = 19,nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date endTime;

	@Column(length = 16)
	private String state;

	@OneToMany(mappedBy = "schedule",targetEntity = ScheduleAccount.class)
	private Set scheduleAccounts = new HashSet(0);

	@OneToMany(mappedBy = "schedule",targetEntity = DeviceCheck.class)
	private Set deviceChecks = new HashSet(0);

}