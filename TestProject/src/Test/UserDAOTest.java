package Test;

import static org.testng.Assert.assertEquals;

import java.sql.SQLException;

import org.hibernate.hql.internal.QueryExecutionRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Optional;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import DAO.User_DAO;
import Interface.UserService;
import Model.Depart;
import Model.Users;
import bsh.ParseException;

@ContextConfiguration(locations = { 
		"classpath:Test/spring-config-dao.xml", 
		"classpath:Test/spring-config-hibernate.xml" 
		})

public class UserDAOTest extends AbstractTestNGSpringContextTests{
	private Users user;
	@Autowired
	private User_DAO dao;
	@BeforeTest
	public void setUp() throws Exception {
			springTestContextAfterTestClass();
	}

	@AfterTest
	public void tearDown() {

	}

	@BeforeMethod
	public void beforeMethod() {
		user = new Users();
	}

	@AfterMethod()
	public void AfterMethod() {
		try {
			dao.Delete(user.getUsername());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

//	@Parameters({ "username", "password", "expected" })
//	@Test(description = "Test DepartMent")
//	public void login(@Optional() String username, @Optional() String password, @Optional() boolean expected)
//			throws ParseException, QueryExecutionRequestException, SQLException {
//		try {
//			boolean actual;
//			user.setUsername(username);
//			user.setPasswords(password);
//			actual = dao.checkLogin(username, password);
//			assertEquals(actual, expected);
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//	}
	
	@Parameters({ "username", "password","fullname", "expected" })
	@Test()
	public void addUser(@Optional() String username, @Optional() String password,@Optional String fullname, @Optional() boolean expected)
			throws ParseException{
		 
		boolean actual;
		user.setUsername(username);
		user.setPasswords(password);
		user.setFullname(fullname);
		actual = dao.save(user);
		assertEquals(actual, expected);
	}
}
