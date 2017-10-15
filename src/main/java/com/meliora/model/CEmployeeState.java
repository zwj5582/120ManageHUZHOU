package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * CEmployeeState entity. @author MyEclipse Persistence Tools
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class CEmployeeState extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;

	@Column
	private String displayName;

	@Column
	private Integer displayOrder;

	@Column
	private String comments;

	@OneToMany(mappedBy = "CEmployeeState",targetEntity = Employee.class)
	private Set employees = new HashSet(0);


}