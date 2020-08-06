package Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DAO.Depart_DAO;
import Interface.DepartSevice;
import Model.Depart;

@Controller
@RequestMapping("/admin/ManergerDepart")
public class Depart_Controller {
	@Autowired
	Depart_DAO dao;

	public void showData(ModelMap model) {
	
		List<Depart> list = dao.getAll();
		model.addAttribute("pb", list);
		
	}
	@RequestMapping()
	public String index(ModelMap model) {
		model.addAttribute("depart", new Depart());
		showData(model);
		return "admin/ManergerDepart";
	}

	@RequestMapping(params = "Insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute Depart depart, BindingResult result) {
		
		if (depart.getId().length() == 0) {
			 result.rejectValue("id", "id", "Vui lòng nhập mã phòng");
			 showData(model);
			return "admin/ManergerDepart";
		}
		if (dao.CheckDuplicate(depart.getId())) {
			
			result.rejectValue("id", "id", "Trùng mã phòng vui lòng nhập lại");
			showData(model);
			return "admin/ManergerDepart";
		}
		if (depart.getName().length() == 0) {
			result.rejectValue("name", "name", "Vui lòng nhập tên phòng");
			showData(model);
			return "admin/ManergerDepart";
		}
//	 

		boolean save = dao.save(depart);
		if (save) {
			model.addAttribute("message_insert_success", "Thêm thành công");
		}else {
			model.addAttribute("message_insert_success", "Thêm thất bại");					
		}
		showData(model);
		
		return "admin/ManergerDepart";
		
	}

	@RequestMapping(params = "Update")
	public String update(ModelMap model, @ModelAttribute Depart depart) {
		boolean save = dao.save(depart);
		if (save) {
			model.addAttribute("message_insert_success", "Cập nhật thành công");
		}else {
			model.addAttribute("message_insert_fail", "Cập nhật thất bại");
		}
		showData(model);
		return "admin/ManergerDepart";
	}

	@RequestMapping(params = "Delete")
	public String delete(ModelMap model, @ModelAttribute Depart depart) {
		boolean delete = dao.Delete(depart.getId());
		if (delete) {
			model.addAttribute("message_insert_success", "Xóa thành công");
		}else {
			model.addAttribute("message_insert_success", "Xóa thất bại");
		}
		showData(model);
		return "admin/ManergerDepart";
	}
	@RequestMapping(params = "Information")
	public String showform(ModelMap model,@ModelAttribute("depart")Depart depart) {
		model.addAttribute("info", depart);
		showData(model);
		return "admin/ManergerDepart";
	}
}
