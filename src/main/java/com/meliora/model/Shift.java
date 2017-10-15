package com.meliora.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Shift entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Shift extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne(targetEntity = Shift.class)
	@JoinColumn(name = "shiftsId",nullable = false)
	private Shifts shifts;

	@Column(length = 16)
	private String type;

	@Column(length = 8)
	@Temporal(TemporalType.TIME)
	private Date beginTime;

	@Column(length = 8)
	@Temporal(TemporalType.TIME)
	private Date endTime;

	@Column
	private Integer isDelete;

	@OneToMany(mappedBy = "shift",targetEntity = Schedule.class)
	private Set schedules = new HashSet(0);

}