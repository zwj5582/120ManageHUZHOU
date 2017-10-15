package com.meliora.model;

import lombok.*;

import javax.persistence.*;

/**
 * HolidaysType entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class HolidaysType extends BaseEntity implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column
	private String name;

	@Column
	private String remarks;

	@Column
	private Integer deleted;

}