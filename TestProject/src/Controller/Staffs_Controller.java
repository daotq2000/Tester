package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import DAO.Staff_DAO;
import Model.Depart;
import Model.Staffs;
@Controller
@RequestMapping("admin/ManagerStaff/")
public class Staffs_Controller {
	@Autowired
	Staff_DAO dao;
	@Autowired
	ServletContext context;

	@RequestMapping("index")
	public String index(ModelMap model) {
		model.addAttribute("staff", new Staffs());
		getList(model);
		return "admin/ManagerStaff";
	}

	@RequestMapping(value = "showupdate", params = "showUpdate", method = RequestMethod.POST)
	public String showUpdate(ModelMap model, @ModelAttribute Staffs staffs) {
		GetDepart(model);
		model.addAttribute("staff", staffs);
		return "admin/ManagerStaff_update";
	}

	@RequestMapping(value = "showinsert", params = "showInsert")
	public String showinsert(ModelMap model, @ModelAttribute Staffs staffs) {
		model.addAttribute("staffs", new Staffs());
		GetDepart(model);
		return "admin/ManagerStaff_insert";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, @RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("depart") String depart, @RequestParam("gender") String gender,
			@RequestParam("birthday") String birthday, @RequestParam("photo") MultipartFile photo,
			@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("salary") Double salary, @RequestParam("notes") String notes,
			@RequestParam("depart") String DepartID) throws IllegalStateException, IOException {
		Staffs staff = new Staffs();
		staff.setId(id);

		staff.setName(name);
		boolean gt;
		if (gender.equals("0")) {
			gt = false;
		} else {
			gt = true;
		}
		staff.setGender(gt);
		String namsinh = dao.getDateFormat(birthday);
		staff.setBirthday(namsinh);
		staff.setEmail(email);
		staff.setPhone(phone);
		staff.setSalary(salary);
		staff.setNotes(notes);
		String photoPath = context.getRealPath("Resources/img/photo_staff/" + photo.getOriginalFilename());
		photo.transferTo(new File(photoPath));
		staff.setPhoto("Resources/img/photo_staff/" + photo.getOriginalFilename());
		boolean save = dao.save(staff, DepartID);
		if (save) {
			model.addAttribute("message", "Thêm thành công");
		} else {
			model.addAttribute("message", "Trùng mã nhân viên, vui lòng nhập lại");
		}
		return "admin/ManagerStaff_insert";

	}

	@RequestMapping("update")
	public String update(ModelMap model, @RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("depart") String depart, @RequestParam("gender") String gender,
			@RequestParam("birthday") String birthday, @RequestParam("photo") MultipartFile photo,
			@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("salary") Double salary, @RequestParam("notes") String notes,
			@RequestParam("depart") String DepartID) throws IllegalStateException, IOException {
		String image = "";
		Staffs staff = new Staffs();
		staff.setId(id);
		staff.setName(name);
		boolean gt;
		if (gender.equals("0")) {
			gt = false;
		} else {
			gt = true;
		}
		staff.setGender(gt);
		staff.setBirthday(birthday);
		staff.setEmail(email);
		staff.setPhone(phone);
		staff.setSalary(salary);
		staff.setNotes(notes);

		if (photo.isEmpty()) {
			image = dao.getphoto(id);
		} else {
			String photoPath = context.getRealPath("Resources/img/photo_staff/" + photo.getOriginalFilename());
			photo.transferTo(new File(photoPath));
			image = "Resources/img/photo_staff/" + photo.getOriginalFilename();
		}
		staff.setPhoto(image);
		boolean update = dao.save(staff, DepartID);
		if (update) {
			model.addAttribute("message_s", "Cập nhật thành công");
		} else {
			model.addAttribute("message_f", "Cập nhật thất bại");
		}
		return "admin/ManagerStaff_update";
	}

	@RequestMapping(value = "delete", params = "Delete")
	public String delete(ModelMap model, @RequestParam("id") String id) {
		boolean delete = dao.Delete(id);
		if (delete) {
			model.addAttribute("message", "Xóa thành công");
		} else {
			model.addAttribute("message", "Xóa thất bại");
		}
		getList(model);
		index(model);
		return "admin/ManagerStaff";
	}

	@RequestMapping("search")
	public String search(@RequestParam("search") String search, ModelMap model) {
		List<Staffs> list = dao.search(search);
		model.addAttribute("list", list);
		if (list.size() < 1) {
			model.addAttribute("message", "Không tìm thấy");
		}
		model.addAttribute("staff", new Staffs());
		return "admin/ManagerStaff";
	}

	public ModelMap getList(ModelMap model) {
		List<Staffs> list = dao.getAll();
		model.addAttribute("list", list);
		return model;
	}

	public ModelMap GetDepart(ModelMap model) {
		List<Depart> list = dao.getDepart();
		model.addAttribute("List", list);
		return model;
	}
}
