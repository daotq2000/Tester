package Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import DAO.Report_DAO;
import Model.Records;
import Model.Users;

@Controller
 
public class Home_Controller {
	@Autowired Report_DAO dao;
	@RequestMapping("admin/index")
	public String index(ModelMap model) {
		List<Records> list = dao.indexPage();
		model.addAttribute("list", list);
		return "admin/index";
	}
	@RequestMapping("admin/logout")
	public String logout(ModelMap model, HttpSession session) {
		model.addAttribute("users", new Users());
		session.setAttribute("username",null);
		session.setAttribute("Nameuser", null);
		return  "redirect:../user/login.htm";
	}
}
