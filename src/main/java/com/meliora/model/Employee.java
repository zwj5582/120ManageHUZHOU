package com.meliora.model;

import lombok.*;
import lombok.Value;
import org.springframework.beans.factory.annotation.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table
public class Employee extends BaseEntity implements java.io.Serializable {

	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "nickName")
	private String nickname;

	@ManyToOne
	@JoinColumn(name = "branchId")
	private Department departmentByBranchId;

	@ManyToOne
	@JoinColumn(name = "departmentId")
	private Department departmentByDepartmentId;

	@ManyToOne
	@JoinColumn(name = "position")
	private CPositionType CPositionType;

	@ManyToOne
	@JoinColumn(name = "appointPostId")
	private AppointPost appointPost;

	@ManyToOne
	@JoinColumn(name = "accountId")
	private Account account;

	@ManyToOne
	@JoinColumn(name = "job")
	private CJobType CJobType;

	@ManyToOne
	@JoinColumn(name = "state")
	private CEmployeeState CEmployeeState;

	@Column
	private String anchorId;

	@Column
	private String jobnumber;

	@Column
	private String timecard;

	@Column
	private String name;

	@Column
	private String pinyinShort;

	@Column
	private String pinyin;

	@Column
	private String sex;

	@Column
	private String jobPosition;

	@Column
	private Date borndate;

	@Column
	private Integer isRegular;

	@Column
	private String idcard;

	@Column
	private String nativePlace;

	@Column
	private String nationality;

	@Column
	private String politicalAffiliation;

	@Column
	private Date jobBegin;

	@Column
	private Date joinParty;

	@Column
	private String education;

	@Column
	private String degree;

	@Column
	private String major;

	@Column
	private Date graduation;

	@Column
	private String school;

	@Column
	private Date joinDate;

	@Column
	private String joinWay;

	@Column
	private Integer isRefer;

	@Column
	private String post;

	@Column
	private String postGrade;

	@Column
	private String jobTitle;

	@Column
	private Date presentJob;

	@Column
	private String includeNumber;

	@Column
	private Date includeDate;

	@Column
	private String sheetNumber;

	@Column
	private String includeFund;

	@Column
	private String drivingLicense;

	@Column
	private String licenseModel;

	@Column
	private Date licenseDate;

	@Column
	private String workPhone;

	@Column
	private String homePhone;

	@Column
	private String mobile;

	@Column
	private String email;

	@Column
	private String postcode;

	@Column
	private String address;

	@Column
	private String comments;

	@Column
	private Date leaveDate;

	@Column
	private String caId;

	@Column
	private String emrType;

	@OneToMany(mappedBy = "employee",targetEntity = IrregularSalary.class)
	private Set irregularSalaries = new HashSet(0);

	@OneToMany(mappedBy = "employee",targetEntity = RegularSalary.class)
	private Set regularSalaries = new HashSet(0);

	/*private Set medicalEthicsBasics = new HashSet(0);
	private Set continueEdus = new HashSet(0);
	private Set mediEthiEvaluats = new HashSet(0);
	private Set personalMajorBasics = new HashSet(0);
	private Set articleReceives = new HashSet(0);
	private Set medEthTrainningPractices = new HashSet(0);
	private Set contracts = new HashSet(0);
	private Set majorSkillExps = new HashSet(0);
	private Set serviceLevelMonths = new HashSet(0);
	private Set treatAccidents = new HashSet(0);
	private Set jobTransfers = new HashSet(0);
	private Set conferenceses = new HashSet(0);
	private Set creditRecords = new HashSet(0);
	private Set eduBackgrounds = new HashSet(0);
	private Set driverHandoversForHandId = new HashSet(0);
	private Set employeeChecks = new HashSet(0);
	private Set feedbacksForDriverId = new HashSet(0);
	private Set employeeAppraisals = new HashSet(0);
	private Set driverHandoversForOverId = new HashSet(0);
	private Set stretcherHandoversForHandId = new HashSet(0);
	private Set irregularSalaryRecords = new HashSet(0);

	private Set feedbacksForOperatorId = new HashSet(0);
	private Set swipeCards = new HashSet(0);
	private Set stretcherHandoversForOverId = new HashSet(0);
	private Set trainAdvanceStudies = new HashSet(0);
	private Set satisfactionSurveies = new HashSet(0);
	private Set regularSalaryRecords = new HashSet(0);

	private Set paperPublishs = new HashSet(0);
	private Set feedbacksForDoctorId = new HashSet(0);
	private Set serviceLevelYears = new HashSet(0);
	private Set subjectResearchs = new HashSet(0);
	private Set petrolCardRecords = new HashSet(0);
	private Set visitLetters = new HashSet(0);
	private Set medicalHistoryImproves = new HashSet(0);

	private Set feedbacksForStretcherId = new HashSet(0);
	private Set scheduleStats = new HashSet(0);
	private Set departmentChecks = new HashSet(0);*/
	
	//add by yanfei 2014/12/18

	@Column
	private String permanentResidenceAddress;//户籍地址

	@Column
	private String emergencyContactPerson;//紧急联系人

	@Column
	private String emergencyContactRelation;

	@Column
	private String emergencyContactPhone;

	@Column
	private Date licenseVerificationTime;

	@OneToMany(mappedBy = "employee",targetEntity = Holidays.class)
	private Set holidayses = new HashSet(0);

}