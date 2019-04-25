package com.pack.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="Vehicle")
@Table(name="tbl_Vehicle")
public class VehicleEntity {

	@Id
	@Column
	private String vehicleNo;
	
	@Column
	private String branch;
	
	@Column
	private String vehicleType;
	
	@Column
	private String insuranceExpiryDate;
	
	@Column
	private String lastServiceDate;
	
	@Column
	private String serviceDueDate;

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public String getInsuranceExpiryDate() {
		return insuranceExpiryDate;
	}

	public void setInsuranceExpiryDate(String insuranceExpiryDate) {
		this.insuranceExpiryDate = insuranceExpiryDate;
	}

	public String getLastServiceDate() {
		return lastServiceDate;
	}

	public void setLastServiceDate(String lastServiceDate) {
		this.lastServiceDate = lastServiceDate;
	}

	public String getServiceDueDate() {
		return serviceDueDate;
	}

	public void setServiceDueDate(String serviceDueDate) {
		this.serviceDueDate = serviceDueDate;
	}
	
}
