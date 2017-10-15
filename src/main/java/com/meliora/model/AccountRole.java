package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * AccountRole entity. @author MyEclipse Persistence Tools
 */


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class AccountRole extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "roleId")
	private Role role;

	@ManyToOne
	@JoinColumn(name = "accountId")
	private Account account;

}