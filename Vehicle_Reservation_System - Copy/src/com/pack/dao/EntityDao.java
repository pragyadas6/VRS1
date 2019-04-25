package com.pack.dao;

import java.util.List;

import com.pack.bean.AdminEntity;
import com.pack.bean.LoginEntity;
import com.pack.bean.VehicleEntity;


public interface EntityDao {
    public List<VehicleEntity> getAllVehicles();
    public VehicleEntity getVehicleById(String vehicleNo);
    public void addVehicle(VehicleEntity employee);
    public void editVehicle(VehicleEntity vehicle);
    public void deleteVehicle(String vehicleNo);

    public AdminEntity loginAdmin(LoginEntity login);
    public AdminEntity getAdminById(String adminId);
    public void addAdmin(AdminEntity admin);
    public void editAdmin(AdminEntity admin);
    public void deleteAdmin(String adminId);
  
    public List<VehicleEntity> searchVehicle(VehicleEntity vehicle);
    public List<String> getAllVehicleType();
	public List<String> getAllBranch();
    
    public void sendMailSSL(String email, VehicleEntity v1);
    public List<String> getAllMails(String branch);
    
    public boolean checkAdminId(String adminId);
    public boolean checkVehicleNo(String vehicleNo);
	public boolean checkEmailId(String emailId);
    
	public void updateToken(LoginEntity login);
	public String findUserByToken(String token);
	public void resetPassword(String username, String password);
	public boolean checkEmail(String email);
	
}
