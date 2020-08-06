package DAO;

import java.util.Date;

import java.util.List;

 

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Interface.RecordsService;
import Model.Records;
import Model.Staffs;
import Model.Users;
@Service
@Transactional
public class Record_DAO implements RecordsService {
@Autowired SessionFactory factory;
	@Override
	public List<Records> getAll() {
		Session session = factory.openSession();
		String hql = "from Records";
		Query query = session.createQuery(hql);
		List<Records> record = query.list();
		return record;
	}

	@Override
	public boolean save(Records records) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();	 
		try {			
			records.setDate(new Date());
			session.saveOrUpdate(records);
			tx.commit();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		return false;
	}

 

	@Override
	public boolean Delete(Long id) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			Records record = (Records) session.load(Records.class, id);
			session.delete(record);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public List<Staffs> getStaff() {
		Session session = factory.openSession();
		String hql = "from Staffs";
		Query query= session.createQuery(hql);
		List<Staffs> list = query.list();
	return list;
	}

	@Override
	public boolean update(Records record, String staffId) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();	 
		try {			
			
			Staffs staff = (Staffs) session.load(Staffs.class,staffId);
			record.setStaffs(staff);
			session.update(record);
			tx.commit();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			session.close();
		}
		return false;
	}

}
