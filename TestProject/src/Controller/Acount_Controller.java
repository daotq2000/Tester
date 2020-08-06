package Controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DAO.User_DAO;
import Model.Users;

@Controller
@RequestMapping("admin/ManagerAcount")
public class Acount_Controller {
	String message = "";
	@Autowired
	User_DAO dao;
	@Autowired
	SessionFactory factory;
	@RequestMapping()
	public String index(ModelMap model) {
		model.addAttribute("Users", new Users());
		showdata(model);
		return "admin/ManagerAcount";
	}
	public void showdata(ModelMap model) {
		List<Users> list = dao.getAll();
		model.addAttribute("list", list);
	}
	@RequestMapping(params = "save", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("Users") @Validated Users users, BindingResult result) {
		boolean saveSavesuccess = dao.save(users);
		if(saveSavesuccess) {
			model.addAttribute("message", "Successfull");
		}else {
			model.addAttribute("message", "Failed");
		}
		showdata(model);
		return "admin/ManagerAcount";
	}

	@RequestMapping(params = "Delete", method = RequestMethod.POST)
	public String delete(ModelMap model, @ModelAttribute("Users") Users users, BindingResult result) {
		boolean delete = dao.Delete(users.getUsername());
		if (delete) {
			message = "Successfull";
		}else {
			message = "Failed";
		}
		model.addAttribute("message", message);
		index(model);
		return "admin/ManagerAcount";
	}

	@RequestMapping(params = "info")
	public String showForm(ModelMap model, @ModelAttribute("Users") Users users) {
		model.addAttribute("Users", users);
		List<Users> list = dao.getAll();
		model.addAttribute("list", list);
		return "admin/ManagerAcount";
	}
}
