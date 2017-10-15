package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * CPositionType entity. @author MyEclipse Persistence Tools
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class CPositionType extends BaseEntity implements java.io.Serializable {

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

	@OneToMany(mappedBy = "CPositionType",targetEntity = Employee.class)
	@JsonIgnore
	private Set employees = new HashSet(0);

}