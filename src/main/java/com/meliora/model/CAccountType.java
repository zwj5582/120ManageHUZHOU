package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * CAccountType entity. @author MyEclipse Persistence Tools
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class CAccountType extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	private String id;
	@Column(length = 16)
	private String displayName;
	@Column
	private Integer displayOrder;
	@Column(length = 256)
	private String comments;
	@OneToMany(mappedBy ="CAccountType",targetEntity=Account.class)
	//@JsonBackReference
	@JsonIgnore
	private Set accounts = new HashSet(0);

}