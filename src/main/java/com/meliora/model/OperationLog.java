package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

/**
 * OperationLog entity. @author MyEclipse Persistence Tools
 */

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class OperationLog extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 32)
	private String type;

	@Column(length = 32)
	private String subtype;

	@Column(length = 32)
	private String opType;

	@Column(length = 19)
	@Temporal(TemporalType.TIMESTAMP)
	private Date changeTime;

	@Column(length = 512)
	private String description;

	@Column
	private Integer accountId;

	@Column(length = 32)
	private String name;

	@Column(length = 32)
	private String vehiclePalate;

	@Column(length = 32)
	private String fromDep;

	@Column(length = 32)
	private String toDep;

	@Column(length = 32)
	private String client;

	@Column(length = 19,nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date modifyTime;

	@Column
	private String remarks;

	@Column
	private Integer deptIdFrom;

	@Column
	private Integer deptIdTo;

	@Column
	private Integer branchIdFrom;

	@Column
	private Integer branchIdTo;

	@Column(name = "changeUsername",length = 32)
	private String changeUserName;

}