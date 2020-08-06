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
import Interface.StaffsService;
import Model.Depart;
import Model.Staffs;
import bsh.ParseException;

@ContextConfiguration(locations = { 
		"classpath:Test/spring-config-dao.xml", 
		"classpath:Test/spring-config-hibernate.xml" 
		})
public class StaffDaoTest extends AbstractTestNGSpringContextTests {
	private Staffs staff;

	@Autowired
	StaffsService staffService;
	@BeforeTest
	public void setUpu() throws Exception {
			springTestContextAfterTestClass();
	}

	@AfterTest
	public void tearDown() {

	}

	@BeforeMethod
	public void beforeMethod() {
		staff = new Staffs();
	}

	@AfterMethod()
	public void AfterMethod() {
		try {
			staffService.Delete(staff.getId());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Parameters({ "id", "name","gender", "birthday", "photo", "email", "phone", "salary",
		"notes", "departId","expected" })
	@Test(description = "Test DepartMent")
	public void addStaff1(@Optional() String id, @Optional() String name,
			@Optional() boolean gender, @Optional() String birthday, @Optional() String photo
			, @Optional() String email, @Optional() String phone, @Optional() Double salary,
			@Optional() String notes, @Optional() String departId, @Optional() boolean expected)
			throws ParseException, QueryExecutionRequestException, SQLException {
		try {
			boolean actual;
			staff.setId(id);
			staff.setName(name);
			staff.setGender(gender);
			staff.setBirthday(birthday);
			staff.setPhoto(photo);
			staff.setEmail(email);
			staff.setPhone(phone);
			staff.setSalary(salary);
			staff.setNotes(notes);
			actual = staffService.save(staff, departId);

			assertEquals(actual, expected);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
