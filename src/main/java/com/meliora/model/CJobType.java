package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * CJobType entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class CJobType extends BaseEntity implements java.io.Serializable {

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

	@OneToMany(mappedBy = "CJobType",targetEntity = Employee.class)
	@JsonIgnore
	private Set employees = new HashSet(0);

}