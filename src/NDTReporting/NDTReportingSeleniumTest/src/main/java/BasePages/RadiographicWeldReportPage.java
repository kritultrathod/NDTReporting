package BasePages;

import java.util.Date;

import ndt_reporting_resuable.Navigation;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;
import org.testng.Assert;
import org.testng.annotations.DataProvider;

public class RadiographicWeldReportPage extends Navigation{

	private String txtClient;
	private String txtContactNumber;
	private String txtContactPerson;
	private String txtJobDescription;
	private String txtLocation;
	private String txtTestReportNumber;
	private String lovRefDocument;
	private String lovRadiationSource;
	private String txtFilmMakeAndType;
	private String txtMaterialSpecification;
	private String txtSurfaceTemperature;
	private String txtTypeofIQI;
	private String txtExtentofExamination;
	private String txtIQIBatchNo;
	private String txtTestLimitations;
	private String txtGeometricalUnsharpness;
	private String txtWeldingMethod;
	private String lovTechniqueId;
	private String txtWeldThickness;
	private String txtShimThickness;
	private String txtWeldPreparation;
	private String txtStageofExamination;
	private String txtIdentificationNo0;
	private String txtJointNo0;
	private String txtWelderNo0;
	private String txtSegment0;
	private String txtFlimSize0;
	private String txtDensity0;
	private String txtSensitivity0;
	private String lovObservation0;
	private boolean acceptNextAlert = true;
	private final StringBuffer verificationErrors = new StringBuffer();

	public RadiographicWeldReportPage(){createData_radiographicpage();}

	public void FillRadiographicReport(String txtClient, String txtContactNumber, String txtContactPerson,
			String	txtJobDescription, String txtLocation, String txtTestReportNumber,String lovRefDocument,
			String lovRadiationSource, String txtFilmMakeAndType, String txtMaterialSpecification, String txtSurfaceTemperature,
			String txtTypeofIQI, String txtExtentofExamination, String txtIQIBatchNo, String txtTestLimitations,
			String txtGeometricalUnsharpness, String txtWeldingMethod, String lovTechniqueId, String txtWeldThickness,
			String txtShimThickness, String txtWeldPreparation, String txtStageofExamination,
			String txtIdentificationNo0, String txtJointNo0, String txtWelderNo0, String txtSegment0, String txtFlimSize0,
			String txtDensity0, String txtSensitivity0, String lovObservation0) throws InterruptedException
			{

		System.out.println("Filing data in all the forms for Radio Graphic form");
		/*Filing data in all the forms for Radio Graphic form*/

		driver.findElement(By.id(RWR_txtClient)).clear();
		driver.findElement(By.id(RWR_txtClient)).sendKeys(txtClient);
		driver.findElement(By.id(RWR_txtContactNumber)).clear();
		driver.findElement(By.id(RWR_txtContactNumber)).sendKeys(txtContactNumber);
		driver.findElement(By.id(RWR_txtContactPerson)).clear();
		driver.findElement(By.id(RWR_txtContactPerson)).sendKeys(txtContactPerson);
		driver.findElement(By.id(RWR_txtJobDescription)).clear();
		driver.findElement(By.id(RWR_txtJobDescription)).sendKeys(txtJobDescription);
		driver.findElement(By.id(RWR_txtLocation)).clear();
		driver.findElement(By.id(RWR_txtLocation)).sendKeys(txtLocation);
		driver.findElement(By.id(RWR_txtTestReportNumber)).clear();
		driver.findElement(By.id(RWR_txtTestReportNumber)).sendKeys(txtTestReportNumber);
		new Select(driver.findElement(By.id(RWR_lovRefDocument))).selectByVisibleText(lovRefDocument);
		new Select(driver.findElement(By.id(RWR_lovRadiationSource))).selectByVisibleText(lovRadiationSource);
		driver.findElement(By.id(RWR_txtFilmMakeAndType)).clear();
		driver.findElement(By.id(RWR_txtFilmMakeAndType)).sendKeys(txtFilmMakeAndType);
		driver.findElement(By.id(RWR_txtMaterialSpecification)).clear();
		driver.findElement(By.id(RWR_txtMaterialSpecification)).sendKeys(txtMaterialSpecification);
		driver.findElement(By.id(RWR_txtSurfaceTemperature)).clear();
		driver.findElement(By.id(RWR_txtSurfaceTemperature)).sendKeys(txtSurfaceTemperature);
		driver.findElement(By.id(RWR_txtTypeofIQI)).clear();
		driver.findElement(By.id(RWR_txtTypeofIQI)).sendKeys(txtTypeofIQI);
		driver.findElement(By.id(RWR_txtExtentofExamination)).clear();
		driver.findElement(By.id(RWR_txtExtentofExamination)).sendKeys(txtExtentofExamination);
		driver.findElement(By.id(RWR_txtIQIBatchNo)).clear();
		driver.findElement(By.id(RWR_txtIQIBatchNo)).sendKeys(txtIQIBatchNo);
		driver.findElement(By.id(RWR_txtTestLimitations)).clear();
		driver.findElement(By.id(RWR_txtTestLimitations)).sendKeys(txtTestLimitations);
		driver.findElement(By.id(RWR_txtGeometricalUnsharpness)).clear();
		driver.findElement(By.id(RWR_txtGeometricalUnsharpness)).sendKeys(txtGeometricalUnsharpness);
		driver.findElement(By.id(RWR_txtWeldingMethod)).clear();
		driver.findElement(By.id(RWR_txtWeldingMethod)).sendKeys(txtWeldingMethod);
		new Select(driver.findElement(By.id(RWR_lovTechniqueId))).selectByVisibleText(lovTechniqueId);
		driver.findElement(By.id(RWR_txtWeldThickness)).clear();
		driver.findElement(By.id(RWR_txtWeldThickness)).sendKeys(txtWeldThickness);
		driver.findElement(By.id(RWR_txtShimThickness)).clear();
		driver.findElement(By.id(RWR_txtShimThickness)).sendKeys(txtShimThickness);
		driver.findElement(By.id(RWR_txtWeldPreparation)).clear();
		driver.findElement(By.id(RWR_txtWeldPreparation)).sendKeys(txtWeldPreparation);
		driver.findElement(By.id(RWR_txtStageofExamination)).clear();
		driver.findElement(By.id(RWR_txtStageofExamination)).sendKeys(txtStageofExamination);

		/*Adding data in test rows*/
		driver.findElement(By.id(RWR_txtIdentificationNo0)).clear();
		driver.findElement(By.id(RWR_txtIdentificationNo0)).sendKeys(txtIdentificationNo0);
		driver.findElement(By.id(RWR_txtJointNo0)).clear();
		driver.findElement(By.id(RWR_txtJointNo0)).sendKeys(txtJointNo0);
		driver.findElement(By.id(RWR_txtWelderNo0)).clear();
		driver.findElement(By.id(RWR_txtWelderNo0)).sendKeys(txtWelderNo0);
		driver.findElement(By.id(RWR_txtSegment0)).clear();
		driver.findElement(By.id(RWR_txtSegment0)).sendKeys(txtSegment0);
		driver.findElement(By.id(RWR_txtFlimSize0)).clear();
		driver.findElement(By.id(RWR_txtFlimSize0)).sendKeys(txtFlimSize0);
		/*driver.findElement(By.id("txtFlimSize0")).clear();
		driver.findElement(By.id("txtFlimSize0")).sendKeys("5");*/
		driver.findElement(By.id(RWR_txtDensity0)).clear();
		driver.findElement(By.id(RWR_txtDensity0)).sendKeys(txtDensity0);
		driver.findElement(By.id(RWR_txtSensitivity0)).clear();
		driver.findElement(By.id(RWR_txtSensitivity0)).sendKeys(txtSensitivity0);
		new Select(driver.findElement(By.id(RWR_lovObservation0))).selectByVisibleText(lovObservation0);
		driver.findElement(By.id(RWR_txtTestDateString)).clear();
		driver.findElement(By.id(RWR_txtTestDateString)).sendKeys("" + new Date());
		driver.findElement(By.id(RWR_txtCalibrationDate)).clear();
		driver.findElement(By.id(RWR_txtCalibrationDate)).sendKeys("" + new Date());
		driver.findElement(By.id(RWR_btn)).click();
		System.out.println("Radiographic welding report submitted successfully");
			}


	@DataProvider(name = "radiographicweldreport")
	public Object[][] createData_radiographicpage() {
		Object[][] retObjArr=getTableArray("resources\\data\\ndt_test_data.xls","radiographicweldreport", "TestData");
		this.txtClient = (String)retObjArr[0][0];
		this.txtContactNumber = (String)retObjArr[0][1];
		this.txtContactPerson = (String)retObjArr[0][2];
		this.txtJobDescription = (String)retObjArr[0][3];
		this.txtLocation = (String)retObjArr[0][4];
		this.txtTestReportNumber = (String)retObjArr[0][5];
		this.lovRefDocument = (String)retObjArr[0][6];
		this.lovRadiationSource = (String)retObjArr[0][7];
		this.txtFilmMakeAndType  = (String)retObjArr[0][8];
		this.txtMaterialSpecification = (String)retObjArr[0][9];
		this.txtSurfaceTemperature = (String)retObjArr[0][10];
		this.txtTypeofIQI = (String)retObjArr[0][11];
		this.txtExtentofExamination = (String)retObjArr[0][12];
		this.txtIQIBatchNo = (String)retObjArr[0][13];
		this.txtTestLimitations = (String)retObjArr[0][14];
		this.txtGeometricalUnsharpness = (String)retObjArr[0][15];
		this.txtWeldingMethod = (String)retObjArr[0][16];
		this.lovTechniqueId = (String)retObjArr[0][17];
		this.txtWeldThickness  = (String)retObjArr[0][18];
		this.txtShimThickness  = (String)retObjArr[0][19];
		this.txtWeldPreparation = (String)retObjArr[0][20];
		this.txtStageofExamination = (String)retObjArr[0][21];
		this.txtIdentificationNo0 =  (String)retObjArr[0][22];
		this.txtJointNo0 = (String)retObjArr[0][23];
		this.txtWelderNo0 = (String)retObjArr[0][24];
		this.txtSegment0 = (String)retObjArr[0][25];
		this.txtFlimSize0 = (String)retObjArr[0][26];
		this.txtDensity0 = (String)retObjArr[0][27];
		this.txtSensitivity0 = (String)retObjArr[0][28];
		this.lovObservation0 = (String)retObjArr[0][29];

		return(retObjArr);
	}

	/*Getter Setter for all elements on this page*/
	public String getTxtClient() {return txtClient;}
	public void setTxtClient(String txtClient) {this.txtClient = txtClient;}

	public String getTxtContactNumber() {return txtContactNumber;}
	public void setTxtContactNumber(String txtContactNumber) {this.txtContactNumber = txtContactNumber;}

	public String getTxtContactPerson() {return txtContactPerson;}
	public void setTxtContactPerson(String txtContactPerson) {this.txtContactPerson = txtContactPerson;}

	public String getTxtJobDescription() {return txtJobDescription;}
	public void setTxtJobDescription(String txtJobDescription) {this.txtJobDescription = txtJobDescription;}

	public String getTxtLocation() {return txtLocation;}
	public void setTxtLocation(String txtLocation) {this.txtLocation = txtLocation;}

	public String getTxtTestReportNumber() {return txtTestReportNumber;}
	public void setTxtTestReportNumber(String txtTestReportNumber) {this.txtTestReportNumber = txtTestReportNumber;}

	public String getLovRefDocument() {return lovRefDocument;}
	public void setLovRefDocument(String lovRefDocument) {this.lovRefDocument = lovRefDocument;}

	public String getLovRadiationSource() {return lovRadiationSource;}
	public void setLovRadiationSource(String lovRadiationSource) {this.lovRadiationSource = lovRadiationSource;}

	public String getTxtFilmMakeAndType() {return txtFilmMakeAndType;}
	public void setTxtFilmMakeAndType(String txtFilmMakeAndType) {this.txtFilmMakeAndType = txtFilmMakeAndType;}

	public String getTxtMaterialSpecification() {return txtMaterialSpecification;}
	public void setTxtMaterialSpecification(String txtMaterialSpecification) {this.txtMaterialSpecification = txtMaterialSpecification;}

	public String getTxtSurfaceTemperature() {return txtSurfaceTemperature;}
	public void setTxtSurfaceTemperature(String txtSurfaceTemperature) {this.txtSurfaceTemperature = txtSurfaceTemperature;}

	public String getTxtTypeofIQI() {return txtTypeofIQI;}
	public void setTxtTypeofIQI(String txtTypeofIQI) {this.txtTypeofIQI = txtTypeofIQI;}

	public String getTxtExtentofExamination() {return txtExtentofExamination;}
	public void setTxtExtentofExamination(String txtExtentofExamination) {this.txtExtentofExamination = txtExtentofExamination;}

	public String getTxtIQIBatchNo() {return txtIQIBatchNo;}
	public void setTxtIQIBatchNo(String txtIQIBatchNo) {this.txtIQIBatchNo = txtIQIBatchNo;}

	public String getTxtTestLimitations() {return txtTestLimitations;}
	public void setTxtTestLimitations(String txtTestLimitations) {this.txtTestLimitations = txtTestLimitations;}

	public String getTxtGeometricalUnsharpness() {return txtGeometricalUnsharpness;}
	public void setTxtGeometricalUnsharpness(String txtGeometricalUnsharpness) {this.txtGeometricalUnsharpness = txtGeometricalUnsharpness;}

	public String getTxtWeldingMethod() {return txtWeldingMethod;}
	public void setTxtWeldingMethod(String txtWeldingMethod) {this.txtWeldingMethod = txtWeldingMethod;}

	public String getLovTechniqueId() {return lovTechniqueId;}
	public void setLovTechniqueId(String lovTechniqueId) {this.lovTechniqueId = lovTechniqueId;}

	public String getTxtWeldThickness() {return txtWeldThickness;}
	public void setTxtWeldThickness(String txtWeldThickness) {this.txtWeldThickness = txtWeldThickness;}

	public String getTxtShimThickness() {return txtShimThickness;}
	public void setTxtShimThickness(String txtShimThickness) {this.txtShimThickness = txtShimThickness;}

	public String getTxtWeldPreparation() {return txtWeldPreparation;}
	public void setTxtWeldPreparation(String txtWeldPreparation) {this.txtWeldPreparation = txtWeldPreparation;}

	public String getTxtStageofExamination() {return txtStageofExamination;}
	public void setTxtStageofExamination(String txtStageofExamination) {this.txtStageofExamination = txtStageofExamination;}

	public String getTxtIdentificationNo0() {return txtIdentificationNo0;}
	public void setTxtIdentificationNo0(String txtIdentificationNo0) {this.txtIdentificationNo0 = txtIdentificationNo0;}

	public String getTxtJointNo0() {return txtJointNo0;}
	public void setTxtJointNo0(String txtJointNo0) {this.txtJointNo0 = txtJointNo0;}

	public String getTxtWelderNo0() {return txtWelderNo0;}
	public void setTxtWelderNo0(String txtWelderNo0) {this.txtWelderNo0 = txtWelderNo0;}

	public String getTxtSegment0() {return txtSegment0;}
	public void setTxtSegment0(String txtSegment0) {this.txtSegment0 = txtSegment0;}

	public String getTxtFlimSize0() {return txtFlimSize0;}
	public void setTxtFlimSize0(String txtFlimSize0) {this.txtFlimSize0 = txtFlimSize0;}

	public String getTxtDensity0() {return txtDensity0;}
	public void setTxtDensity0(String txtDensity0) {this.txtDensity0 = txtDensity0;}

	public String getTxtSensitivity0() {return txtSensitivity0;}
	public void setTxtSensitivity0(String txtSensitivity0) {this.txtSensitivity0 = txtSensitivity0;}

	public String getLovObservation0() {return lovObservation0;}
	public void setLovObservation0(String lovObservation0) {this.lovObservation0 = lovObservation0;}

	public void validateConfimationEdit(){
		driver.findElement(By.id("ctl00_ContentPlaceHolder1_btnValidate1")).click();
		Assert.assertEquals("SucessFully Updated", closeAlertAndGetItsText());
		closeAlertAndGetItsText();
	}

	public void validateConfimation() throws InterruptedException{
		driver.findElement(By.id("ctl00_ContentPlaceHolder1_btnValidate1")).click();
		Assert.assertEquals("SucessFully Saved", closeAlertAndGetItsText());
		closeAlertAndGetItsText();

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

	public void validateLovsOnPageLoad() throws Exception {

		try {
			Assert.assertTrue(driver.findElement(By.cssSelector("BODY")).getText().matches("^[\\s\\S]*XXG2005 Sr 6041Delta IR/0910Spec2T SE/0812[\\s\\S]*$"));
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}

		try {
			Assert.assertTrue(driver.findElement(By.cssSelector("BODY")).getText().matches("^[\\s\\S]*DWSIDWDISWSI[\\s\\S]*$"));
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}

		try {
			Assert.assertTrue(driver.findElement(By.cssSelector("BODY")).getText().matches("^[\\s\\S]*IP/LPADRTLFPorRSSLGr\\.PorRepUCBTAcc[\\s\\S]*$"));
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}

		try {
			Assert.assertTrue(driver.findElement(By.cssSelector("BODY")).getText().matches("^[\\s\\S]*AcceptReject[\\s\\S]*$"));
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}

		try {
			Assert.assertTrue(driver.findElement(By.cssSelector("BODY")).getText().matches("^[\\s\\S]*ASTM for Radiogrphy of WeldASTM for Radiography of CastingASME for UT of Weld[\\s\\S]*$"));
		} catch (Error e) {
			verificationErrors.append(e.toString());
		}
	}

}

