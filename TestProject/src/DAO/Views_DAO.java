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

import Interface.Viewer;
import Model.Views;

@Service
@Transactional
public class Views_DAO implements Viewer{
@Autowired SessionFactory factory;
	@Override
	public boolean saveOrUpdate(Views view) {
		Session session = factory.openSession();
		Transaction tx =session.beginTransaction();
		try {
			session.saveOrUpdate(view);
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally {
			session.close();
			
		}
		return false;
	}

	@Override
	public List<Views> getAll() {
		Session session = factory.openSession();
		String hql = "from Views";
		Query q = session.createQuery(hql);
		List<Views> list = q.list();
		return list;
	}

	@Override
	public List<Views> getView() {
		Session session = factory.openSession();
		String hql = "Select v from Views v where v.id=1";
		Query q = session.createQuery(hql);
		List<Views> list = q.list();
		return list;
	}

}
