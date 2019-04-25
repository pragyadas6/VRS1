package com.pack.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pack.bean.AdminEntity;
import com.pack.bean.LoginEntity;
import com.pack.bean.VehicleEntity;
import com.pack.service.ServiceManager;


@Controller
public class EntityController {

	@Autowired
	private ServiceManager serviceManager;

	public AdminEntity admin = null;

	//public String adminId;

	public void setVehicleManager(ServiceManager vehicleManager) {
		this.serviceManager = vehicleManager;
	}

	@RequestMapping(value = "/addVehicle", method = RequestMethod.POST)
	public String addVehicle(
			@ModelAttribute(value = "vehicle") VehicleEntity vehicle,
			BindingResult result, HttpSession session) {
		serviceManager.addVehicle(vehicle);
		List<String> allVehicleType = serviceManager.getAllVehicleType();
		List<String> allBranch = serviceManager.getAllBranch();
		session.setAttribute("allVehicleType", allVehicleType);
		session.setAttribute("allBranch", allBranch);
		JOptionPane.showMessageDialog(null, "Vehicle Details are Added successfully");
		return "redirect:/list";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		model.addAttribute("login", new LoginEntity());
		return "login";
	}

	@RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
	public String addAdmin(@ModelAttribute(value ="employee") AdminEntity admin, BindingResult result) {
		serviceManager.addAdmin(admin);
		JOptionPane.showMessageDialog(null, "your Details are Added successfully");
		return "redirect:/login";

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute("admin", new AdminEntity());
		return "register";

	}

	@RequestMapping(value = "/home")
	public String loginAdmin(@ModelAttribute(value = "login") LoginEntity login, ModelMap model, HttpSession session) {
		String l = "login";
		AdminEntity l1 = null;
		l1 = (AdminEntity) serviceManager.loginAdmin(login);
		admin=l1;
		if(l1 != null){
			l="redirect:/homeAgain";
			List<String> allVehicleType = serviceManager.getAllVehicleType();
			List<String> allBranch = serviceManager.getAllBranch();
			session.setAttribute("allVehicleType", allVehicleType);
			session.setAttribute("allBranch", allBranch);
			session.setAttribute("currentAdmin", l1);
		}
		return l;
	}

	@RequestMapping(value = "/homeAgain")
	public String homeAgain(ModelMap model){
		return "home";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String goCreate(ModelMap model) {
		model.addAttribute("create", new VehicleEntity());
		return "create";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String goSearch(ModelMap model) {
		model.addAttribute("searchVehicle", new VehicleEntity());
		return "search";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goList(ModelMap model) {
		model.addAttribute("vehicle", new VehicleEntity());
		model.addAttribute("vehicleList", serviceManager.getAllVehicles());
		return "list";
	}

	@RequestMapping(value = "/editAdmin/{adminId}", method=RequestMethod.GET)
	public String goEditAdmin(@PathVariable("adminId") String adminId, ModelMap model) {
		AdminEntity l1 = null;
		l1 = (AdminEntity) serviceManager.getAdminById(adminId);
		model.addAttribute("currentAdmin1", l1);
		return "updateAdmin";
	}

	@RequestMapping(value = "/editCurrentAdmin", method=RequestMethod.POST)
	public String editAdmin(@ModelAttribute(value = "currentAdmin1") AdminEntity admin, ModelMap model, HttpSession session) {
		serviceManager.editAdmin(admin);
		session.setAttribute("currentAdmin", admin);
		JOptionPane.showMessageDialog(null, "Your Details are Updated successfully");
		return "redirect:/homeAgain";
	}

	@RequestMapping(value = "/deleteAdmin/{adminId}", method = RequestMethod.GET)
	public String deleteAdmin(@PathVariable("adminId") String adminId, ModelMap model) {
		serviceManager.deleteAdmin(adminId);
		return "redirect:/login";
	}

	@RequestMapping("/delete/{vehicleNo}")
	public String deleteVehicle(@PathVariable("vehicleNo") String vehicleNo) {
		serviceManager.deleteVehicle(vehicleNo);
		return "redirect:/list";
	}

	@RequestMapping("/edit/{vehicleNo}")
	public String goEditVehicle(@PathVariable("vehicleNo") String vehicleNo, ModelMap model) {
		VehicleEntity v1 = null;
		v1 = (VehicleEntity) serviceManager.getVehicleById(vehicleNo);
		model.addAttribute("vehicle", v1);
		return "updateVehicle";
	}

	@RequestMapping(value = "/editCurrentVehicle", method=RequestMethod.POST)
	public String editVehicle(@ModelAttribute(value = "currentVehicle") VehicleEntity vehicle, ModelMap model) {
		serviceManager.editVehicle(vehicle);
		JOptionPane.showMessageDialog(null, "Vehicle Details are Updated successfully");
		return "redirect:/list";
	}

	@RequestMapping(value = "/searchVehicle", method = RequestMethod.POST)
	public String searchVehicle(@ModelAttribute(value = "searchVehicle") VehicleEntity searchVehicle, ModelMap model) {
		if(searchVehicle.getBranch() != "" || searchVehicle.getLastServiceDate() != "" || searchVehicle.getVehicleType() != "" || searchVehicle.getServiceDueDate() != "" ){
			List<VehicleEntity> list = null;
			list = serviceManager.searchVehicle(searchVehicle);
			model.addAttribute("searchList", list);
		}
		model.addAttribute("searchVehicle", new VehicleEntity());
		return "search";
	}

	@RequestMapping(value = "/sendMailSSL/{vehicleNo}", method = RequestMethod.GET)
	public String sendMailSSL(@PathVariable("vehicleNo") String vehicleNo, ModelMap map){
		VehicleEntity v1 = serviceManager.getVehicleById(vehicleNo);
		List<String> l = serviceManager.getAllMails(v1.getBranch());
		map.addAttribute("vehicle", v1);
		map.addAttribute("vehicle", new VehicleEntity());
		String email;
		for(int i=0; i<l.size(); i++){
			email = l.get(i);
			serviceManager.sendMailSSL(email,v1);
		}
		return "redirect:/list";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "logout";
	}

	@RequestMapping(value = "/checkAdminId")
	@ResponseBody
	public String checkAdminId(@RequestParam String adminId){
		if(serviceManager.checkAdminId(adminId))
			return "Admin id is Available";
		else
			return "Admin id is Taken";
	}

	@RequestMapping(value = "/checkEmailId")
	@ResponseBody
	public String checkEmailId(@RequestParam String emailId){
		if(serviceManager.checkEmailId(emailId))
			return "Email id is Available";
		else
			return "Email id is Taken";
	}

	@RequestMapping(value = "/checkVehicleNo")
	@ResponseBody
	public String checkVehicleNo(@RequestParam String vehicleNo){
		if(serviceManager.checkVehicleNo(vehicleNo))
			return "Vehicle No is Available";
		else
			return "Vehicle No is Taken";
	}

	@RequestMapping(value="/forgotPassword")
	public String forgotPassword(ModelMap modelMap){

		modelMap.addAttribute("login", new LoginEntity());
		return "forgotPassword";

	}

	@RequestMapping(value="/checkEmail")
	@ResponseBody
	public String checkEmail(@RequestParam String email)
	{
		if(serviceManager.checkEmail(email)==false)
			return "Email id is Available";
		else
			return "Email id is taken";
	}

	@RequestMapping(value="/submitEmail", method=RequestMethod.POST)
	public String submitEmail(@ModelAttribute("login") LoginEntity login, BindingResult bindingResult,HttpServletRequest request){
		serviceManager.sendMail(login,request);
		return "resetPasswordMessage";
	}


	@RequestMapping("/reset")
	public String resetPassword(@RequestParam("token")String token,ModelMap model) {

		String emailId=serviceManager.findUserByToken(token);
		if(emailId!=null)
		{
			model.addAttribute("reset", new LoginEntity());
			model.addAttribute("token", token);
			return "passwordReset";
		}
		else
			return "";
	}

	@RequestMapping("/resetCommit")
	public String commitResetPassword(@RequestParam("token")String token,@ModelAttribute("login")LoginEntity login)
	{
		String emailId=serviceManager.findUserByToken(token);
		serviceManager.resetPassword(emailId,login.getPassword());
		return "redirect:/login";
	}
}
