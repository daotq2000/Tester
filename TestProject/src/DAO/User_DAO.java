package DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;

import Interface.UserService;
import Model.Users;
@Service
@Transactional
public class User_DAO implements UserService {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Users> getAll() {
		Session session = factory.openSession();
		String hql = "from Users";
		List<Users> list = session.createQuery(hql).list();
		return list;
	}

	@Override
	public boolean save(Users user) {
		boolean isSuccess = false;
		Session session = factory.openSession();
		Transaction ts = session.beginTransaction();

		try {
			session.saveOrUpdate(user);
			
			ts.commit();
			isSuccess = true;
		} catch (Exception e) {
			ts.rollback();
		} finally {
			session.close();
		}
		return isSuccess;

	}

	@Override
	public boolean Delete(String id) {
		Session session = factory.openSession();
		Transaction ts = session.beginTransaction();
		try {
			Users users = (Users) session.load(Users.class, id);
			session.delete(users);
			ts.commit();
			return true;
		} catch (Exception e) {
			ts.rollback();
			e.printStackTrace();
		} finally {
			session.close();

		}
		return false;
	}

	@Override
	public boolean checkLogin(String username, String passwords) {
		Session session = factory.openSession();
		String hql = "from Users where username =? and passwords = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, passwords);
		List<Users> list = query.list();
		if (list.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkAcountGoogle(String username) {
		boolean isExist = false;
		Session session = factory.openSession();
		String hql = "from Users where username=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, username);
		List<Users> listUser = query.list();
		if (listUser.size() > 0) {
			isExist = true;
		}
		return isExist;
	}

	@Override
	public Boolean checkFpt(String email) {
		int check = email.indexOf("@fpt.edu.vn");
		boolean isFptGroup = false;
		if (check != -1) {
			isFptGroup = true;
		} else {
			isFptGroup = false;
		}
		return isFptGroup;
	}

	@Override
	public String getFullname(String username) {
		Session session = factory.openSession();
		String hql = "select r from Users r where r.username =? ";
		Query q = session.createQuery(hql);
		q.setParameter(0, username);
		List<Users> list = q.list();
		String fullname = list.get(0).getFullname();
		return fullname;
	}

}
