package DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import Interface.DepartSevice;
import Model.Depart;
@Service
@Transactional
public class Depart_DAO implements DepartSevice {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Depart> getAll() {
		Session session = factory.openSession();
		String hql = "from Depart";
		List<Depart> list = session.createQuery(hql).list();
		return list;
	}

	@Override
	public boolean save(Depart depart) {
		Session session = factory.openSession();
		try {

			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(depart);
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;

	}

	@Override
	public boolean update(String id) {

		return false;
	}

	@Override
	public boolean Delete(String id) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			Depart depart = (Depart) session.load(Depart.class, id);
			session.delete(depart);
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
	public boolean CheckDuplicate(String id) {
		Session session = factory.openSession();
		String hql = "from Depart";
		Query query = session.createQuery(hql);
		List<Depart> list = query.list();
		for (int i = 0; i < list.size(); i++) {
			if(id.equals(list.get(i).getId())) {
					return true;
			}
		}
		 
		return false;
	}

}
