package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * DeviceCheck entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class DeviceCheck extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "item")
	private CDeviceCheckItem CDeviceCheckItem;

	@ManyToOne
	@JoinColumn(name = "scheduleId",nullable = false)
	private Schedule schedule;

	@Column(length = 32)
	private String takeover;

	@Column(length = 32)
	private String handover;

}