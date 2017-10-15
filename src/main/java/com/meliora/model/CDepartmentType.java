package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.javafx.beans.IDProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * CDepartmentType entity. @author MyEclipse Persistence Tools
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class CDepartmentType extends BaseEntity implements java.io.Serializable {

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

	@OneToMany(mappedBy = "CDepartmentType",targetEntity = Department.class)
	@JsonIgnore
	private Set departments = new HashSet(0);

}