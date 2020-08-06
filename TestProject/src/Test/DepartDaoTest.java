package Test;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.fail;

import java.sql.SQLException;

import org.hibernate.hql.internal.QueryExecutionRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Optional;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import org.testng.annotations.AfterMethod;
import DAO.Depart_DAO;
import Interface.DepartSevice;
import Model.Depart;
import bsh.ParseException;

@ContextConfiguration(locations = { 
		"classpath:Test/spring-config-dao.xml", 
		"classpath:Test/spring-config-hibernate.xml" 
		})
public class DepartDaoTest extends AbstractTestNGSpringContextTests {
	private Depart depart;

	@Autowired
	DepartSevice departDao;
	@BeforeTest
	public void setUpu() throws Exception {
			springTestContextAfterTestClass();
	}

	@AfterTest
	public void tearDown() {

	}

	@BeforeMethod
	public void beforeMethod() {
		depart = new Depart();
	}

	@AfterMethod()
	public void AfterMethod() {
		try {
			departDao.Delete(depart.getId());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Parameters({ "id", "name", "expected" })
	@Test(description = "Test DepartMent")
	public void addStaff1(@Optional() String id, @Optional() String name, @Optional() boolean expected)
			throws ParseException, QueryExecutionRequestException, SQLException {
		boolean actual;
		depart.setId(id);
		depart.setName(name);
		actual = departDao.save(depart);

		assertEquals(actual, expected);
	}
}
