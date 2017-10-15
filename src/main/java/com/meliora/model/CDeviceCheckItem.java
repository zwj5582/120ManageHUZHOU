package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * CDeviceCheckItem entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class CDeviceCheckItem extends BaseEntity implements
		java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;

	@Column(length = 16)
	private String displayName;

	@Column
	private Integer displayOrder;

	@Column(length = 256)
	private String comments;

	@OneToMany(mappedBy = "CDeviceCheckItem",targetEntity = DeviceCheck.class)
	private Set deviceChecks = new HashSet(0);

}