package BasePages;

import java.util.Date;

import ndt_reporting_resuable.Navigation;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;
import org.testng.Assert;

public class CreateTemplatePage extends Navigation{

	private boolean acceptNextAlert = true;
	public static String lovtemplatetype = "//select[@id='cmbTest']";
	public static String clicktemplateSubmit = "//input[@id='Button1']";
	public static String txtTemplateName = "txtTemplateName";
	public static String clickSave = "btnSave";

	/*To be parametarized*/
	public void templatename() throws InterruptedException{
		driver.findElement(By.xpath(lovtemplatetype)).isDisplayed();
		new Select(driver.findElement(By.xpath(lovtemplatetype))).selectByVisibleText("Radiographic Examination for Welded Joints");
		driver.findElement(By.xpath(clicktemplateSubmit)).click();
		driver.findElement(By.id(txtTemplateName)).click();
		driver.findElement(By.id(txtTemplateName)).clear();
		driver.findElement(By.id(txtTemplateName)).sendKeys("tempalte" + new Date());
		driver.findElement(By.id(clickSave)).click();
		Assert.assertEquals("Template saved sucessfully.", closeAlertAndGetItsText());
	}

	private String closeAlertAndGetItsText() {
		try {
			Alert alert = driver.switchTo().alert();
			if (acceptNextAlert) {
				alert.accept();
			} else {
				alert.dismiss();
			}
			return alert.getText();
		} finally {
			acceptNextAlert = true;
		}
	}
}