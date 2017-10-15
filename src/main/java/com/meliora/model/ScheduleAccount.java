package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

/**
 * ScheduleAccount entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class ScheduleAccount extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "scheduleId",nullable = false)
	private Schedule schedule;

	@ManyToOne
	@JoinColumn(name = "type",nullable = false)
	private CParticipateType CParticipateType;

	@ManyToOne
	@JoinColumn(name = "accountId",nullable = false)
	private Account account;

	@Column(length = 16)
	private String displayName;

	@Column(nullable = false)
	private Integer isOvertime;

	@Column(length = 19)
	@Temporal(TemporalType.TIMESTAMP)
	private Date startWork;

	@Column(length = 32)
	private String startWorkOperator;

	@Column(length = 19)
	@Temporal(TemporalType.TIMESTAMP)
	private Date finishWork;

	@Column(length = 32)
	private String finishWorkOperator;

	@Column(length = 16,nullable = false)
	private String state;

}