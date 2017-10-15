package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * IrregularSalary entity. @author MyEclipse Persistence Tools
 */

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class IrregularSalary extends BaseEntity implements java.io.Serializable {

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
	private Float salary3;

	@Column(precision = 12)
	private Float deduction1;

	@Column(precision = 12)
	private Float deduction2;

	@Column(precision = 12)
	private Float deduction3;

	@Column(precision = 12)
	private Float deduction4;

}