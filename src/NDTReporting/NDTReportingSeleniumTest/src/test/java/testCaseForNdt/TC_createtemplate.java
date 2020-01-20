package testCaseForNdt;

import ndt_reporting_resuable.Login;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import BasePages.CreateTemplatePage;


public class TC_createtemplate extends CreateTemplatePage{
	Login login = new Login();
	CreateTemplatePage createtemplatepage = new CreateTemplatePage();

	@BeforeClass
	public void setUpone() throws Exception {
		System.out.println("Test Case for Radiographic Weld Report to begin");
		createtemplatepage.NavigateToNdtUrl();
		createtemplatepage.validateloginpageelements();
		createtemplatepage.userlogin(getUsername(),getPassword());
		createtemplatepage.validatemenuelements();
	}

	@Test
	public void test_radiographicweldreport() throws Exception
	{
		createtemplatepage.NavigateToCreateTemplate();
		createtemplatepage.templatename();
	}

	@AfterClass
	public void tearDownone() throws Exception {
		createtemplatepage.clickLogout();
	}

}
