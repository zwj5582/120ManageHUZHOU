package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * RegularSalary entity. @author MyEclipse Persistence Tools
 */

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class RegularSalary extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "employeeId",unique = true,nullable = false)
	private Employee employee;

	@Column(nullable = false,precision = 12)
	private Float salary1;

	@Column(precision = 12)
	private Float salary2;

	@Column(precision = 12)
	private Float salary3;

	@Column(precision = 12)
	private Float salary4;

	@Column(precision = 12)
	private Float salary5;

	@Column(precision = 12)
	private Float salary6;

	@Column(precision = 12)
	private Float salary7;

	@Column(precision = 12)
	private Float salary8;

	@Column(precision = 12)
	private Float salary9;

	@Column(precision = 12)
	private Float salary10;

	@Column(precision = 12)
	private Float salary11;

	@Column(precision = 12)
	private Float salary12;

	@Column(precision = 12)
	private Float salary13;

	@Column(precision = 12)
	private Float salary14;

	@Column(precision = 12)
	private Float salary15;

	@Column(precision = 12)
	private Float salary16;

	@Column(precision = 12)
	private Float deduction1;

	@Column(precision = 12)
	private Float deduction2;

	@Column(precision = 12)
	private Float deduction3;

	@Column(precision = 12)
	private Float deduction4;

	@Column(precision = 12)
	private Float deduction5;

	@Column(precision = 12)
	private Float deduction6;

	@Column(precision = 12)
	private Float deduction7;


}