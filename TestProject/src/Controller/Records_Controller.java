package Controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import DAO.Record_DAO;
import Mailer.Mailer;
import Model.Records;
import Model.Staffs;

@Controller
@RequestMapping("admin/Achievements/")
public class Records_Controller {
	@Autowired
	Record_DAO dao;

	@RequestMapping("index")
	public String index(ModelMap model) {
		model.addAttribute("records", new Records());
		getRecords(model);
		getStaff(model);
		return "admin/Achievements";
	}

	public List<Records> getRecords(ModelMap model) {
		List<Records> record = dao.getAll();
		model.addAttribute("record", record);
		return record;
	}

	public List<Staffs> getStaff(ModelMap model) {
		List<Staffs> list = dao.getStaff();
		model.addAttribute("staff", list);
		return list;
	}
	@RequestMapping("showupdate")
	public String showupdate(@ModelAttribute("records") Records records,ModelMap model) {
		model.addAttribute("cord", records);
		index(model);
		return "admin/Achievements_update";
	}
	@RequestMapping("Insert")
	public String insert(ModelMap model, @ModelAttribute("records") Records records, BindingResult result) {
		if (records.getReason().equals("")) {
			result.rejectValue("reason", "records", "Vui lòng nhập lý do");
			getRecords(model);
			getStaff(model);
			return "admin/Achievements";
		}
		boolean save = dao.save(records);
		if (save) {
			model.addAttribute("message", "Thêm thành công");
		} else {
			model.addAttribute("message_u", "Thêm thất bại");
		}
		index(model);
		return "admin/Achievements";
	}

	@RequestMapping("update")
	public String update(ModelMap model, @RequestParam("id") Long id, @RequestParam("type") Boolean type,
		@RequestParam("reason") String reason, @RequestParam("Staff") String staffid) {
		Records records = new Records();
		records.setDate(new Date());
		records.setType(type);
		records.setReason(reason);
		records.setId(id);
		boolean update = dao.update(records, staffid);
		if (update) {
			model.addAttribute("message_u", "Cập nhật thành công");
		} else {
			model.addAttribute("message_u", "Cập nhật thất bại");
		}
		index(model);
		return "redirect:index.htm";

	}

	@RequestMapping("delete")
	public String delete(ModelMap model, @RequestParam("idRecord") Long id) {
		boolean delete = dao.Delete(id);
		if (delete) {
			model.addAttribute("message_u", "Xóa thành công");
		} else {
			model.addAttribute("message_u", "Xóa thất bại");
		}
		index(model);
		return "admin/Achievements";
	}

	@Autowired
	Mailer mailer;

	@RequestMapping("sendMail")
	public String sendMail(ModelMap model, @RequestParam("from") String from, @RequestParam("to") String to,
			@RequestParam("title") String title, @RequestParam("content") String content) {
		try {
			mailer.sendMail(from, to, title, content);
			model.addAttribute("messageEmail", "Gửi Email thành công");
			index(model);
		} catch (Exception e) {
			model.addAttribute("messageEmail", "Gửi Email thất bại");
		}
		return "admin/Achievements";
	}

}
