package ndt_reporting_resuable;

import org.openqa.selenium.By;
import org.testng.annotations.DataProvider;

public class Login extends Initial {

	private String username;
	private String password;


	//Login Fields
	public static String login_username = "EmailIDTextBox";
	public static String login_password = "PasswordTextBox";
	public static String login_button = "LogInButton";

	public Login(){
		createData1();
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void userlogin(String username, String password){
		driver.findElement(By.id(login_username)).clear();
		driver.findElement(By.id(login_password)).clear();
		driver.findElement(By.id(login_username)).sendKeys(username);
		driver.findElement(By.id(login_password)).sendKeys(password);
		driver.findElement(By.id(login_button)).click();
	}


	@DataProvider(name = "user_login")
	public Object[][] createData1() {

		Object[][] retObjArr=getTableArray("resources\\data\\ndt_test_data.xls","user_login", "TestData");
		this.username = (String)retObjArr[0][0];
		this.password = (String)retObjArr[0][1];

		return(retObjArr);
	}
}
