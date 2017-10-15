package com.meliora.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class Account extends BaseEntity implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "type")
	//@JsonManagedReference
	private CAccountType CAccountType;

	@Column
	private String username;

	@Column
	private String password;

	@Column
	private String state;

	@Column
	private Integer domainId;

	@OneToMany(mappedBy = "account",targetEntity = Department.class)
	@JsonIgnore
	private Set departments = new HashSet(0);

	@OneToMany(mappedBy = "account",targetEntity = Employee.class)
	@JsonIgnore
	private Set employees = new HashSet(0);

	@OneToMany(mappedBy = "account",targetEntity = AccountRole.class)
	@JsonIgnore
	private Set accountRoles = new HashSet(0);

	@OneToMany(mappedBy = "account",targetEntity = ScheduleAccount.class)
	@JsonIgnore
	private Set scheduleAccounts = new HashSet(0);

	/*
	private Set vehiclesForMStationAccountId = new HashSet(0);
	private Set invoiceRecordsForUser = new HashSet(0);
	private Set vehicleTracks = new HashSet(0);
	private Set deviceHandoversForHandOver = new HashSet(0);
	private Set invoicesForHandOver = new HashSet(0);
	private Set invoiceSummariesForUserId = new HashSet(0);
	private Set vehiclesForConferenceAccountId = new HashSet(0);


	private Set invoiceRecordsForHandOver = new HashSet(0);
	private Set invoiceSummariesForOperationId = new HashSet(0);
	private Set vehiclesForAccountId = new HashSet(0);
	private Set deviceHandoversForTakeOver = new HashSet(0);
	private Set invoicesForUser = new HashSet(0);
	private Set sickbeds = new HashSet(0);
	private Set vehicleStateLists = new HashSet(0);
	private Set communicateCounts = new HashSet(0);

	*/

}