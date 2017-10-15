package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Shifts entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Shifts extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "departmentId",nullable = false)
	private Department department;

	@Column(length = 32,nullable = false)
	private String name;

	@Column
	private Integer isDelete;

	/*@OneToMany(mappedBy = "shifts",targetEntity = Shift.class)
	private Set<Shift> shifts = new HashSet<>(0);*/

}