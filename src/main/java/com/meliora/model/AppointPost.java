package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * AppointPost entity. @author MyEclipse Persistence Tools
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class AppointPost extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column
	private String type;

	@Column
	private String name;

	@Column
	private String comments;

	@OneToMany(mappedBy = "appointPost",targetEntity = Employee.class)
	@JsonIgnore
	private Set employees = new HashSet(0);


}