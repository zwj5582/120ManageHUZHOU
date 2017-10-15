package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class Menu extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "parentId")
	private Menu menu;

	@Column
	private String name;

	@Column
	private String url;

	@Column
	private String comments;

	@Column
	private Integer  sort=0;

	@Column
	private String icon;

	@OneToMany(mappedBy = "menu",targetEntity = RoleMenu.class)
	@JsonIgnore
	private Set<RoleMenu> roleMenus = new HashSet<>(0);

	@OneToMany(mappedBy = "menu",targetEntity = Menu.class)
	@JsonIgnore
	private Set<Menu> menus = new HashSet<>(0);


}