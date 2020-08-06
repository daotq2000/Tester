package Controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import DAO.Report_DAO;
import Mailer.Mailer;
import Model.Records;
@Transactional
@Controller
@RequestMapping("admin/Report")
public class Controller_Report {
@Autowired Report_DAO dao;
	
	@RequestMapping("index")
public String getReport(ModelMap model) {
	List<Records> list = dao.getDepart();
	model.addAttribute("items", list);
	List<Records> list2 = dao.getPerson();
	model.addAttribute("pb", list2);
	return "admin/Report";					
}

	
}
