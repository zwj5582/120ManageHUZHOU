package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class Role extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(nullable = false)
	private String name;

	@Column
	private String comments;

	@OneToMany(mappedBy = "role",targetEntity = AccountRole.class)
	private Set accountRoles = new HashSet(0);

	@OneToMany(mappedBy = "role",targetEntity = RoleMenu.class)
	private Set roleMenus = new HashSet(0);

}