package com.pack.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pack.bean.AdminEntity;
import com.pack.bean.LoginEntity;
import com.pack.bean.VehicleEntity;

@Repository
public class EntityDaoImpl implements EntityDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addVehicle(VehicleEntity vehicle) {
		this.sessionFactory.getCurrentSession().save(vehicle);
	}

	@Override
	public List<VehicleEntity> getAllVehicles() {
        return this.sessionFactory.getCurrentSession().createQuery("from Vehicle").list();
	}

	@Override
	public void addAdmin(AdminEntity admin) {
		this.sessionFactory.getCurrentSession().save(admin);
		LoginEntity login = new LoginEntity();
		login.setEmailId(admin.getEmailId());
		login.setPassword(admin.getPassword());
		login.setStatus(null);
		login.setAdminId(admin.getAdminId());
		login.setResetToken(null);
		this.sessionFactory.getCurrentSession().save(login);
	}

	@Override
	public AdminEntity loginAdmin(LoginEntity login) {
		AdminEntity l1 = null;
		Session s = this.sessionFactory.openSession();
		Transaction t = s.beginTransaction();
		Query q = s.createQuery("from Admin l where l.adminId=:adminId and l.password=:password");
		q.setParameter("adminId", login.getAdminId());
		q.setParameter("password", login.getPassword());
		l1 = (AdminEntity) q.uniqueResult();
		return l1;
	}

	@Override
	public AdminEntity getAdminById(String adminId) {
		AdminEntity l1 = null;
		Session s = this.sessionFactory.openSession();
		Transaction t = s.beginTransaction();
		Query q = s.createQuery("from Admin l where l.adminId=:adminId");
		q.setParameter("adminId", adminId);
		l1 = (AdminEntity) q.uniqueResult();
		return l1;
	}

	@Override
	public void editAdmin(AdminEntity admin) {
		this.sessionFactory.getCurrentSession().update(admin);
		LoginEntity login = new LoginEntity();
		login.setAdminId(admin.getAdminId());
		login.setEmailId(admin.getEmailId());
		login.setPassword(admin.getPassword());
		login.setResetToken("");
		login.setStatus("");
		this.sessionFactory.getCurrentSession().update(login);
	}

	@Override
	public void deleteAdmin(String adminId) {
		AdminEntity admin = (AdminEntity) sessionFactory.getCurrentSession().load(
				AdminEntity.class, adminId);
        if (null != admin) {
            this.sessionFactory.getCurrentSession().delete(admin);
        }
	}

	@Override
	public void deleteVehicle(String vehicleNo) {
		VehicleEntity vehicle = (VehicleEntity) sessionFactory.getCurrentSession().load(
				VehicleEntity.class, vehicleNo);
        if (null != vehicle) {
        	this.sessionFactory.getCurrentSession().delete(vehicle);
        }
	}

	@Override
	public VehicleEntity getVehicleById(String vehicleNo) {
		VehicleEntity v1 = null;
		Session s = this.sessionFactory.openSession();
		Transaction t = s.beginTransaction();
		Query q = s.createQuery("from Vehicle v where v.vehicleNo=:vehicleNo");
		q.setParameter("vehicleNo", vehicleNo);
		v1 = (VehicleEntity) q.uniqueResult();
		return v1;
	}

	@Override
	public void editVehicle(VehicleEntity vehicle) {
		this.sessionFactory.getCurrentSession().update(vehicle);
	}

	@Override
	public List<VehicleEntity> searchVehicle(VehicleEntity vehicle) {
		List<VehicleEntity> list = null;
		Session s = this.sessionFactory.getCurrentSession();
		Query q = null;
		String qwry = "from Vehicle v where";
		if(vehicle.getBranch() != null && !vehicle.getBranch().equals("")){
			qwry += " branch= '"+String.valueOf(vehicle.getBranch()+"'");
		}
		if(vehicle.getVehicleType() != null && !vehicle.getVehicleType().equals("")){
			if(qwry.endsWith("where"))
				qwry += " vehicleType= '"+String.valueOf(vehicle.getVehicleType()+"'");
			else
				qwry += " and vehicleType= '"+String.valueOf(vehicle.getVehicleType()+"'");
		}
		if(vehicle.getServiceDueDate() != null && !vehicle.getServiceDueDate().equals("")){
			if(qwry.endsWith("where"))
				qwry += " serviceDueDate like '_____"+String.valueOf(vehicle.getServiceDueDate()+"%'");
			else
				qwry += " and serviceDueDate like '_____"+String.valueOf(vehicle.getServiceDueDate()+"%'");
		}
		if(vehicle.getLastServiceDate() != null && !vehicle.getLastServiceDate().equals("")){
			if(qwry.endsWith("where"))
				qwry += " lastServiceDate like '_____"+String.valueOf(vehicle.getLastServiceDate()+"%'");
			else
				qwry += " and lastServiceDate like '_____"+String.valueOf(vehicle.getLastServiceDate()+"%'");
		}
		q = s.createQuery(qwry);
		list = q.list();
		return list;
	}
	
	@Override
	public void sendMailSSL(String email, VehicleEntity v1) {
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
					InternetAddress.parse(email));
			message.setSubject("Vehicle Registration System");
			message.setText("Vehicle Number: "+v1.getVehicleNo()+" need to be updated !!!!!!!!!"+"\nThe service due date is "+v1.getServiceDueDate()+"\nThe insurance expiry date is "+v1.getInsuranceExpiryDate());
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	@Override
	public List<String> getAllMails(String branch) {
		List<AdminEntity> l = null;
		Query q = sessionFactory.getCurrentSession().createQuery("from Admin where branch=:branch");
		q.setParameter("branch", branch);
		l=q.list();
		List<String> l1 = new ArrayList<String>();
		for(AdminEntity e: l) {
			if(e.getEmailId() != null)
				l1.add(e.getEmailId());
		}
		return l1;
	}

	@Override
	public boolean checkAdminId(String adminId) {
		List<String> l = null;
		Session s = this.sessionFactory.openSession();
		try{
			String hql = "select l from Admin l where l.adminId=:adminId";
			Query q = s.createQuery(hql);
			q.setParameter("adminId", adminId);
			l =q.list();
		}
		catch(Exception e){
			System.out.println("Error");
		}
		s.close();
		if(l.isEmpty())
			return true;
		return false;
	}

	@Override
	public boolean checkVehicleNo(String vehicleNo) {
		List<String> l = null;
		Session s = this.sessionFactory.openSession();
		try{
			String hql = "select l from Vehicle l where l.vehicleNo=:vehicleNo";
			Query q = s.createQuery(hql);
			q.setParameter("vehicleNo", vehicleNo);
			l = q.list();
		}
		catch(Exception e){
			System.out.println("Error");
		}
		s.close();
		if(l.isEmpty())
			return true;
		return false;
	}
	
	@Override
	public boolean checkEmailId(String emailId) {
		AdminEntity l = null;
		Session s = this.sessionFactory.openSession();
		try{
			String hql = "from Admin l where l.emailId=:emailId";
			Query q = s.createQuery(hql);
			q.setParameter("emailId", emailId);
			l = (AdminEntity)q.uniqueResult();
		}
		catch(Exception e){
			System.out.println("Error");
		}
		s.close();
		if(l == null)
			return true;
		return false;
	}


	@Override
	public List<String> getAllVehicleType() {
		List<String> allVehicleType = null;
		Session s = this.sessionFactory.openSession();
		String qry = "select distinct v.vehicleType from Vehicle v";
		Query q = s.createQuery(qry);
		allVehicleType = q.list();
		return allVehicleType;
	}

	@Override
	public List<String> getAllBranch() {
		List<String> allBranch = null;
		Session s = this.sessionFactory.openSession();
		String qry = "select distinct v.branch from Vehicle v";
		Query q = s.createQuery(qry);
		allBranch = q.list();
		return allBranch;
	}

	@Override
	public void updateToken(LoginEntity login) {
		String hql = "UPDATE Login set resetToken=:resetToken "  + 
				"WHERE emailId = :emailId";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("resetToken", login.getResetToken());
		query.setParameter("emailId", login.getEmailId());
		int result = query.executeUpdate();
	}

	@Override
	public String findUserByToken(String token) {
		List<String> list=null;
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		try{
			String hql = "SELECT emailId from  Login l WHERE l.resetToken LIKE ?";
			Query q = s.createQuery(hql);
			q.setParameter(0, token);
			list = q.list();
		}
		catch (Exception e) {
			System.out.println("Error");
		}
		s.close();
		if(list.isEmpty())
			return null;
		else
			return list.get(0);
	}

	@Override
	public void resetPassword(String emailId, String password) {
		String hql = "UPDATE Login set password = :password,resetToken=:resetToken "+ 
				"WHERE emailId = :emailId";
		String hql1 = "UPDATE Admin set password = :password"+ 
				"WHERE emailId = :emailId";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("password", password);
		query.setParameter("resetToken","");
		query.setParameter("emailId", emailId);
		int result = query.executeUpdate();
		Query query1 = this.sessionFactory.getCurrentSession().createQuery("UPDATE Admin set password = :password WHERE emailId = :emailId");
		query1.setParameter("password", password);
		query1.setParameter("emailId", emailId);
		int result1 = query1.executeUpdate();
	}

	@Override
	public boolean checkEmail(String emailId) {
		List<String> list=null;
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		try{
			String hql = "SELECT emailId from  Login l WHERE l.emailId LIKE ?";
			Query q = s.createQuery(hql);
			q.setParameter(0, emailId);
			list = q.list();
		}
		catch (Exception e) {
			System.out.println("Error");
		}
		s.close();
		if(list.isEmpty())
			return false;
		else
			return true;
	}
	
}
