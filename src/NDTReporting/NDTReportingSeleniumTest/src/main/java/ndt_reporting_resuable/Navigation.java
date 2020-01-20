package ndt_reporting_resuable;

import org.openqa.selenium.By;
import org.testng.Assert;

public class Navigation extends Login {

	public static String baseUrl = "http://ndtreports.teamartha.com/PresentationLayer/LoginForm.aspx";
	public static String clickEditReport = "//a[contains(text(),'Edit Report')]";
	public static String clickCreateTemplate = "//a[contains(text(),'CreateTemplate')]";
	public static String logout = "//a[contains(text(),'Logout')]";

	private final StringBuffer verificationErrors = new StringBuffer();

	/*Navigate to NDTPAGE*/
	public void NavigateToNdtUrl(){
		driver.get(baseUrl);
	}

	/*Naviagate to Edit Report Page*/
	public void NavigateToEditReport() throws InterruptedException{
		Thread.sleep(5000);
		driver.findElement(By.xpath(clickEditReport)).isDisplayed();
		driver.findElement(By.xpath(clickEditReport)).click();
	}

	/*Naviagate to Create Template Page*/
	public void NavigateToCreateTemplate() throws InterruptedException{
		//driver.findElement(By.xpath(clickCreateTemplate)).click();
		Thread.sleep(5000);
		driver.findElement(By.xpath(clickCreateTemplate)).click();
	}

	/*Currently hardcoded to be modified*/
	public void SelectRecordToEdit(){
		driver.findElement(By.linkText("Edit")).click();
	}

	public void clickLogout() throws InterruptedException{
		driver.findElement(By.xpath(logout)).click();
	}


	//Add Product Elements Alias (AP_)
	public String AP_Name = "txtName";
	public String AP_Unit = "txtUnit";
	public String AP_Quantity = "txtQty";
	public String AP_Click_Save = "butSave";
	public String draganddropUrl = "http://www.ndtreports.teamartha.com/Dragjson";
	public String client = "//*[@id='JobDescription']/div[1]/div[1]/div[1]";
	public String contactperson = "//*[@id='JobDescription']/div[2]/div[1]/div[1]";
	public String testdate = "//*[@id='JobDescription']/div[2]/div[5]/div[1]";
	public String radiographicweldreport = "http://ndtreports.teamartha.com/RadiographicWeldReport.aspx";

	//Radiographic weld report Elements Alias (RWR_)
	public String RWR_txtClient = "txtClient";
	public String RWR_txtContactNumber = "txtContactNumber";
	public String RWR_txtContactPerson = "txtContactPerson";
	public String RWR_txtJobDescription = "txtJobDescription";
	public String RWR_txtLocation = "txtLocation";
	public String RWR_txtTestReportNumber = "txtTestReportNumber";
	public String RWR_txtIdentificationNo0 = "txtIdentificationNo0";
	public String RWR_txtJointNo0 = "txtJointNo0";
	public String RWR_txtWelderNo0 = "txtWelderNo0";
	public String RWR_txtSegment0 = "txtSegment0";
	public String RWR_txtFlimSize0 = "txtFlimSize0";
	public String RWR_lovRefDocument = "cmbRefDocument";
	public String RWR_lovRadiationSource = "cmbRadiationSource";
	public String RWR_txtFilmMakeAndType = "txtFilmMakeAndType";
	public String RWR_txtMaterialSpecification = "txtMaterialSpecification";
	public String RWR_txtSurfaceTemperature = "txtSurfaceTemperature";
	public String RWR_txtTypeofIQI = "txtTypeofIQI";
	public String RWR_txtExtentofExamination = "txtExtentofExamination";
	public String RWR_txtIQIBatchNo = "txtIQIBatchNo";
	public String RWR_txtTestLimitations = "txtTestLimitations";
	public String RWR_txtGeometricalUnsharpness = "txtGeometricalUnsharpness";
	public String RWR_txtWeldingMethod = "txtWeldingMethod";
	public String RWR_lovTechniqueId = "cmbTechniqueId";
	public String RWR_txtWeldThickness = "txtWeldThickness";
	public String RWR_txtShimThickness = "txtShimThickness";
	public String RWR_txtWeldPreparation = "txtWeldPreparation";
	public String RWR_txtStageofExamination = "txtStageofExamination";
	public String RWR_txtDensity0 = "txtDensity0";
	public String RWR_txtSensitivity0 = "txtSensitivity0";
	public String RWR_lovObservation0 = "cmbObservation0";
	public String RWR_txtCalibrationDate = "txtCalibrationDate";
	public String RWR_txtTestDateString = "txtTestDate";
	public String RWR_btn = "ctl00_ContentPlaceHolder1_btnValidate1";

	//Signup
	public String SU_REmailIDTextbox = "REmailIDTextbox";
	public String SU_RPasswordTextBox = "RPasswordTextBox";
	public String SU_ConfirmPasswordTextBox = "ConfirmPasswordTextBox";
	public String SU_RCompanyNameTextBox = "RCompanyNameTextBox";
	public String SU_RNameTextBox = "RNameTextBox";
	public String SU_RMobileNOTextBox = "RMobileNOTextBox";
	public String SU_SQDropDownList = "SQDropDownList";
	public String SU_SATextBox = "SATextBox";
	public String SU_RSignUpButton = "RSignUpButton";


	//Validations for menu
	public void validatemenuelements() {
		try {
			Assert.assertEquals("Create Report", driver.findElement(By.xpath("//a[contains(text(),'Create Report')]")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("Edit Report", driver.findElement(By.xpath("//a[contains(text(),'Edit Report')]")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("Print Report", driver.findElement(By.xpath("//a[contains(text(),'Print Report')]")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("CreateTemplate", driver.findElement(By.xpath("//a[contains(text(),'CreateTemplate')]")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("Logout", driver.findElement(By.xpath("//a[contains(text(),'Logout')]")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
	}

	public void validateloginpageelements(){
		try {
			Assert.assertEquals("", driver.findElement(By.id("EmailIDTextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("PasswordTextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("LogInButton")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("Keep me logged in", driver.findElement(By.cssSelector("label")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("KeepmeloggedinCheckBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertTrue(driver.findElement(By.id("ForgotPasswordHyperLink")).getText().matches("^exact:Forgot your password[\\s\\S]$"));
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("REmailIDTextbox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("RPasswordTextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("ConfirmPasswordTextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("RCompanyNameTextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("RNameTextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("RMobileNOTextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}

		try {
			Assert.assertTrue(driver.findElement(By.cssSelector("BODY")).getText().matches("^[\\s\\S]*What's Your Father Name[\\s\\S] What's Your Mother Name[\\s\\S] What's Your School Name[\\s\\S][\\s\\S]*$"));
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("SATextBox")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("RSignUpButton")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("", driver.findElement(By.id("RCancelButton")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
		try {
			Assert.assertEquals("FeedBack", driver.findElement(By.id("Feedbackhyperlink")).getText());
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
	}



}
