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

import Interface.StaffsService;
import Model.Depart;
import Model.Staffs;
@Service
@Transactional
public class Staff_DAO implements StaffsService {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Staffs> getAll() {
		Session session = factory.openSession();
		String hql = "from Staffs ";
		Query query = session.createQuery(hql);
		List<Staffs> list = query.list();
		return list;
	}

	@Override
	public boolean save(Staffs staff, String departID) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			Depart depart = (Depart) session.load(Depart.class, departID);
			staff.setDepart(depart);
			session.saveOrUpdate(staff);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean Delete(String id) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {

			Staffs staff = (Staffs) session.load(Staffs.class, id);
			session.delete(staff);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Depart> getDepart() {
		Session session = factory.openSession();
		String hql = "from Depart";
		Query query = session.createQuery(hql);
		List<Depart> depart = query.list();
		return depart;
	}

	@Override
	public String getDateFormat(String date) {
		String year = date.substring(6, date.length());
		String month = date.substring(0, 2);
		String day = date.substring(3, 5);
		return year + "-" + month + "-" + day;
	}

	@Override
	public String getphoto(String id) {
		Session session = factory.openSession();
		String hql = "from Staffs where id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		List<Staffs> list = query.list();
		String photo = list.get(0).getPhoto();
		return photo;
	}

	@Override
	public List<Staffs> search(String search) {
		Session session = factory.openSession();
		String hql = "from Staffs where id=? or name like ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, search);
		query.setParameter(1, "%" + search + "%");
		List<Staffs> list = query.list();
		return list;
	}

}
