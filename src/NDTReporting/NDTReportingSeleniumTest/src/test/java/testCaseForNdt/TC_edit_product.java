package testCaseForNdt;

import ndt_reporting_resuable.Navigation;

import org.openqa.selenium.By;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

public class TC_edit_product extends Navigation{

	@Test (dataProvider = "edit_product")
	public void add_product_entry(String Product, String Unit, String Quantity) throws InterruptedException{
		driver.get(baseUrl);
		driver.findElement(By.linkText("Edit")).click();
		Thread.sleep(2000);
		driver.findElement(By.id(AP_Name)).clear();
		driver.findElement(By.id(AP_Unit)).clear();
		driver.findElement(By.id(AP_Quantity)).clear();
		driver.findElement(By.id(AP_Name)).sendKeys(Product);
		driver.findElement(By.id(AP_Unit)).sendKeys(Unit);
		driver.findElement(By.id(AP_Quantity)).sendKeys(Quantity);
		driver.findElement(By.id(AP_Click_Save)).click();
		Thread.sleep(2000);
		driver.switchTo().alert().accept();
		System.out.println("edit_product_entry test case has passed successfully");
	}

	@DataProvider(name = "edit_product")
	public Object[][] createData1() {
		Object[][] retObjArr=getTableArray("resources\\data\\ndt_test_data.xls","edit_product", "TestData");
		return(retObjArr);
	}
}

