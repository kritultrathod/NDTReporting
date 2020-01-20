package testCaseForNdt;

import ndt_reporting_resuable.Navigation;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.testng.annotations.Test;

public class TC_drag_drop extends Navigation{



	@Test
	public void draganddrop() throws InterruptedException{
		driver.get(draganddropUrl);
		WebElement element = driver.findElement(By.xpath(client));
		WebElement target = driver.findElement(By.xpath(contactperson));
		Thread.sleep(2000);
		(new Actions(driver)).dragAndDrop(element, target).perform();
		Thread.sleep(3000);
		WebElement element1 = driver.findElement(By.xpath(testdate));
		WebElement target1 = driver.findElement(By.xpath(client));
		(new Actions(driver)).dragAndDrop(element1, target1).perform();
		Thread.sleep(3000);
	}
}
