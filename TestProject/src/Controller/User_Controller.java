package Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;

import DAO.Report_DAO;
import DAO.User_DAO;
import DAO.Views_DAO;
import GoogleHelper.LoginWithGoogle;
import Model.Records;
import Model.Users;
import Model.Views;
import Test.DepartDaoTest;
import bsh.ParseException;

@Transactional
@Controller
public class User_Controller {
	private static final String CLIENT_ID = "1045280647911-nh3smq3e2lilcs4aeccn8ojrctbggo41.apps.googleusercontent.com";
	@Autowired
	User_DAO dao;
	@Autowired
	Report_DAO rpDao;
	@Autowired Views_DAO viewdao;

	@RequestMapping(value = "user/login", method = RequestMethod.GET)
	public String login(ModelMap model,HttpSession session) {
		
		model.addAttribute("users", new Users());
		List<Views> list = viewdao.getAll();
		long numberViewer = list.get(0).getView();
		numberViewer++;
		Views view = new Views(1,numberViewer);
		viewdao.saveOrUpdate(view);
		session.setAttribute("views", numberViewer);
		return "user/login";
	}

	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	public String login(ModelMap model, @ModelAttribute Users users, BindingResult result, HttpSession s,
			HttpServletRequest request) {
		boolean LoginSuccess = dao.checkLogin(users.getUsername(), users.getPasswords());
		if (LoginSuccess) {
			String fullname = dao.getFullname(users.getUsername());
			s.setAttribute("username", users.getUsername());
			index(model);
			s.setAttribute("Nameuser", fullname);
			return "admin/index";
		} else {
			if (users.getUsername().equals("")) {
				result.rejectValue("username", "users", "Vui lòng nhập tên tài khoản");
			} else if (users.getPasswords().equals("")) {
				result.rejectValue("passwords", "users", "Vui lòng nhập mật khẩu");
			} else {
				model.addAttribute("message", "Tài khoản hoặc mật khẩu không đúng");
			}
		}
		return "user/login";
	}

	@RequestMapping(value = "user/LoginWithGoogle", method = RequestMethod.POST)
	public String loginWithGoogle(ModelMap model, @RequestParam("id_token") String id_token,
			@RequestParam("id") String id, HttpSession s, HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/html");
		String name;
		String email;
		try {
			GoogleIdToken.Payload payLoad = LoginWithGoogle.getPayload(id_token);
			name = (String) payLoad.get("name");
			email = payLoad.getEmail();
			boolean isExist = dao.checkAcountGoogle(email);
			if (isExist) {
				index(model);
				s.setAttribute("Nameuser", name);
				return "admin/index";
			} else {
				if (dao.checkFpt(email)) {
					Users users = new Users(email, id, name);
					boolean saveAcountGoogle = dao.save(users);
					if (saveAcountGoogle) {
						model.addAttribute("message", "Lưu thành công");
						index(model);
						s.setAttribute("username", email);
						s.setAttribute("Nameuser", name);
						return "admin/index";
					} else {
						model.addAttribute("message", "Đăng nhập thất bại");
						return "user/login";
					}
				} else {
					model.addAttribute("message", "Bạn không phải nhân viên của tập đoàn ABC");
					model.addAttribute("users", new Users());
					return "user/login";
				}
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public ModelMap index(ModelMap model) {
		List<Records> list = rpDao.indexPage();
		model.addAttribute("list", list);
		return model;
	}

}
