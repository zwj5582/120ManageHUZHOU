package com.meliora.model;

import lombok.*;

import javax.persistence.*;

/**
 * RoleMenu entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class RoleMenu extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "menuId",nullable = false)
	private Menu menu;

	@ManyToOne
	@JoinColumn(name = "roleId",nullable = false)
	private Role role;

}