package Test;

import static org.testng.Assert.assertEquals;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;


public class AutomaticTesting {
static public WebDriver driver;
	
	@BeforeMethod
	public void beforeMethod() {
		String url = "http://localhost:8081/Assignment/";
		driver.get(url);
	}
	
	@AfterMethod
	public void afterMethod() {
	}
	
	@BeforeTest
	public static void beforeTest() {
		System.setProperty("webdriver.chrome.driver", "D:\\semium\\chrom\\chromedriver.exe");
	    driver = new ChromeDriver();
		driver.manage().window().maximize();
		String url = "http://localhost:8081/Assignment/";
		driver.get(url);
		WebElement UsernameFied = driver.findElement(By.id("username"));
		UsernameFied.sendKeys("admin");
		WebElement PasswordFied = driver.findElement(By.id("passwords"));
		PasswordFied.sendKeys("admin");
		WebElement LoginButun = driver.findElement(By.className("btn btn-primary btn-block"));
		LoginButun.click();
	}

	@AfterTest
	public static void afterTest() {
		driver.close();
	}
	
	@Test(description = "Để trống tất cả các trường", priority = 1)
	public void TNV_01() {
		try {
			WebElement LoginButun = driver.findElement(By.id("submit"));
			LoginButun.click();
			Thread.sleep(1000);
			WebElement invalidDiv = driver.findElement(By.id("error"));
			String actual = invalidDiv.getText();
			assertEquals(actual, "Vui lòng thêm các thông tin sau đây !");
		} catch (Exception e) {

		}
	}

}
