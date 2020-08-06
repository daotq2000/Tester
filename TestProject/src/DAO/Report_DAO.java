package DAO;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Interface.ReportService;
import Model.Records;
@Service
@Transactional
public class Report_DAO implements ReportService {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Records> getDepart() {
		Session session = factory.openSession();
		String hql = "SELECT r.staffs.id,r.staffs.name, " + " SUM(case when r.type=1 then 1 else 0 end), "
				+ " SUM(case when r.type=0 then 1 else 0 end),r.staffs.email " + " FROM Records r "
				+ " GROUP BY r.staffs.id,r.staffs.name,r.staffs.email";
		Query query = session.createQuery(hql);
		List<Records> list = query.list();
		return list;
	}

	@Override
	public List<Records> getPerson() {
		Session session = factory.openSession();
		String hql = "select  r.staffs.depart.id,r.staffs.depart.name, "
				+ " SUM(case when r.type=1 then 1 else 0 end), " + " SUM(case when r.type=0 then 1 else 0 end) "
				+ "   from Records r inner join r.staffs " + " GROUP BY r.staffs.depart.id,r.staffs.depart.name";
		Query query = session.createQuery(hql);
		List<Records> list = query.list();
		return list;
	}

	@Override
	public List<Records> indexPage() {
		Session session = factory.openSession();
		String hql = "Select r.staffs.name,r.staffs.photo,r.staffs.depart.name,"
				+ "SUM(case when r.type=1 then 1 else 0 end)-" + "SUM(case when r.type=0 then 1 else 0 end)  "
				+ "from Records r " + "Group by r.staffs.name,r.staffs.photo,r.staffs.depart.name "
				+ "Having SUM(case when r.type=1 then 1 else 0 end)-SUM(case when r.type=0 then 1 else 0 end)>0"
				+ "Order by SUM(case when r.type=1 then 1 else 0 end)-SUM(case when r.type=0 then 1 else 0 end) DESC ";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(10);
		List<Records> list = query.list();
		return list;
	}

}
