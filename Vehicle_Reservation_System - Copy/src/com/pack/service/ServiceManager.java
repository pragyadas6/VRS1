package com.pack.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pack.bean.AdminEntity;
import com.pack.bean.LoginEntity;
import com.pack.bean.VehicleEntity;

public interface ServiceManager {
	
	public AdminEntity loginAdmin(LoginEntity login);
	public AdminEntity getAdminById(String adminId);
	public void addAdmin(AdminEntity admin);
	public void editAdmin(AdminEntity admin);
	public void deleteAdmin(String adminId);
	
	public VehicleEntity getVehicleById(String vehicleNo);
	public void addVehicle(VehicleEntity vehicle);
	public void editVehicle(VehicleEntity vehicle);
	public void deleteVehicle(String vehicleNo);
	public List<VehicleEntity> getAllVehicles();
	
	public List<VehicleEntity> searchVehicle(VehicleEntity vehicle);
	public List<String> getAllVehicleType();
	public List<String> getAllBranch();
	
	public List<String> getAllMails(String branch);
	public void sendMailSSL(String email, VehicleEntity v1);
	
	public boolean checkAdminId(String adminId);
	public boolean checkVehicleNo(String vehicleNo);
	public boolean checkEmailId(String emailId);
	
	public boolean checkEmail(String email);
	public void sendMail(LoginEntity login, HttpServletRequest request);
	public String findUserByToken(String token);
	public void resetPassword(String username, String password);

}
