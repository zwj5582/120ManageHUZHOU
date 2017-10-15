package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

/**
 * HolidaysRecord entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class HolidaysRecord extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "holidaysId",nullable = false)
	private Holidays holidays;

	@Column
	private Date startTime;

	@Column
	private Date endTime;

	@Column
	private Integer day;

	@Column
	private String remarks;

}