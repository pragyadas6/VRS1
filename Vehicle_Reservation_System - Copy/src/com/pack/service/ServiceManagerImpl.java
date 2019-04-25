package com.pack.service;

import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pack.bean.AdminEntity;
import com.pack.bean.LoginEntity;
import com.pack.bean.VehicleEntity;
import com.pack.dao.EntityDao;

@Service
public class ServiceManagerImpl implements ServiceManager {

	@Autowired
    private EntityDao entityDao;

	/*--------------------------------------------Create Vehicle------------------------------------------------------*/
	
	@Override
	@Transactional
	public void addVehicle(VehicleEntity vehicle) {
		entityDao.addVehicle(vehicle);
	}
	
	/*--------------------------------------------List Vehicle------------------------------------------------------*/

	@Override
	@Transactional
	public List<VehicleEntity> getAllVehicles() {
		return entityDao.getAllVehicles();
	}

	/*--------------------------------------------Register Admin------------------------------------------------------*/
	
	@Override
	@Transactional
	public void addAdmin(AdminEntity admin) {
		entityDao.addAdmin(admin);
	}

	/*--------------------------------------------Checking Login Credentials------------------------------------------------------*/
	
	@Override
	@Transactional
	public AdminEntity loginAdmin(LoginEntity login) {
		AdminEntity l = null;
		l=entityDao.loginAdmin(login);
		return l;
	}
	
	/*--------------------------------------------Fetching Admin Details using Id------------------------------------------------------*/

	@Override
	@Transactional
	public AdminEntity getAdminById(String adminId) {
		AdminEntity l = null;
		l=entityDao.getAdminById(adminId);
		return l;
	}
	
	/*--------------------------------------------Update Admin Details------------------------------------------------------*/

	@Override
	@Transactional
	public void editAdmin(AdminEntity admin) {
		entityDao.editAdmin(admin);
	}
	
	/*--------------------------------------------Delete Admin Account------------------------------------------------------*/

	@Override
	@Transactional
	public void deleteAdmin(String adminId) {
		entityDao.deleteAdmin(adminId);
	}
	
	/*--------------------------------------------Delete Vehicle------------------------------------------------------*/

	@Override
	@Transactional
	public void deleteVehicle(String vehicleNo) {
		entityDao.deleteVehicle(vehicleNo);
	}
	
	/*--------------------------------------------Fetching Vehicle Details using Id------------------------------------------------------*/

	@Override
	@Transactional
	public VehicleEntity getVehicleById(String vehicleNo) {
		VehicleEntity v = null;
		v = entityDao.getVehicleById(vehicleNo);
		return v;
	}
	
	/*--------------------------------------------Fetching Vehicle Details using Id------------------------------------------------------*/

	@Override
	@Transactional
	public void editVehicle(VehicleEntity vehicle) {
		entityDao.editVehicle(vehicle);
	}
	
	/*--------------------------------------------Searching Vehicle Details using Fields------------------------------------------------------*/

	@Override
	@Transactional
	public List<VehicleEntity> searchVehicle(VehicleEntity vehicle) {
		List<VehicleEntity> list = null;
		list = entityDao.searchVehicle(vehicle);
		return list;
	}

	@Override
	@Transactional
	public List<String> getAllVehicleType() {
		return entityDao.getAllVehicleType();
	}

	@Override
	@Transactional
	public List<String> getAllBranch() {
		return entityDao.getAllBranch();
	}
	
	/*--------------------------------------------Sending Vehicle Details via mail------------------------------------------------------*/

	@Override
	@Transactional
	public List<String> getAllMails(String branch) {
		return entityDao.getAllMails(branch);
	}
	
	@Override
	@Transactional
	public void sendMailSSL(String email, VehicleEntity v1) {
		entityDao.sendMailSSL(email, v1);
	}
	
	/*--------------------------------------------Checking Admin Id in Database------------------------------------------------------*/

	@Override
	@Transactional
	public boolean checkAdminId(String adminId) {
		boolean bool = entityDao.checkAdminId(adminId);
		return bool;
	}
	
	/*--------------------------------------------Checking Vehicle No in Database------------------------------------------------------*/

	@Override
	@Transactional
	public boolean checkVehicleNo(String vehicleNo) {
		boolean bool = entityDao.checkVehicleNo(vehicleNo);
		return bool;
	}
	
	/*-------------------------------------Checking Email Id in Database-----------------------------------------------------*/
	
	@Override
	@Transactional
	public boolean checkEmailId(String emailId) {
		boolean bool = entityDao.checkEmailId(emailId);
		return bool;
	}

	/*----------------------------------------Resetting Password when Forgotten----------------------------------------------*/
	
	@Override
	public boolean checkEmail(String email) {
		return entityDao.checkEmail(email);
	}

	@Override
	@Transactional
	public void sendMail(LoginEntity login, HttpServletRequest request) {
		String appUrl = request.getScheme() + "://" + request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		login.setResetToken(UUID.randomUUID().toString());
		entityDao.updateToken(login);
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ChoHelen1097","pass.1234");
				}
			});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("chohelen1097@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(login.getEmailId()));
			message.setSubject("Password Reset Request");
			message.setText("To reset your password, click the link below:\n" + appUrl+ "/reset?token=" + login.getResetToken());
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public String findUserByToken(String token) {
		String username=entityDao.findUserByToken(token);
		return username;
	}

	@Override
	@Transactional
	public void resetPassword(String username, String password) {
		entityDao.resetPassword(username,password);
	}
	
}
