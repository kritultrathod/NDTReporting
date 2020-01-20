package testCaseForNdt;

import ndt_reporting_resuable.Login;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import BasePages.RadiographicWeldReportPage;

public class TC_edit_radiographicweldreport extends RadiographicWeldReportPage{
	Login login = new Login();
	RadiographicWeldReportPage radiographicweldreportpage = new RadiographicWeldReportPage();

	@BeforeClass
	public void setUpone() throws Exception {
		System.out.println("Test Case for Edit Radiographic Weld Report to begin");
		radiographicweldreportpage.NavigateToNdtUrl();
		radiographicweldreportpage.validateloginpageelements();
		radiographicweldreportpage.userlogin(getUsername(),getPassword());
		radiographicweldreportpage.validatemenuelements();
	}

	@Test
	public void test_editradiographicweldreport() throws Exception
	{
		radiographicweldreportpage.NavigateToEditReport();
		radiographicweldreportpage.SelectRecordToEdit();
		radiographicweldreportpage.validateLovsOnPageLoad();
		radiographicweldreportpage.FillRadiographicReport(getTxtClient(), getTxtContactNumber(), getTxtContactPerson(), getTxtJobDescription(), getTxtLocation(), getTxtTestReportNumber(),	getLovRefDocument(), getLovRadiationSource(), getTxtFilmMakeAndType(), getTxtMaterialSpecification(), getTxtSurfaceTemperature(), getTxtTypeofIQI(), getTxtExtentofExamination(), getTxtIQIBatchNo(), getTxtTestLimitations(), getTxtGeometricalUnsharpness(), getTxtWeldingMethod(), getLovTechniqueId(), getTxtWeldThickness(), getTxtShimThickness(), getTxtWeldPreparation(), getTxtStageofExamination(), getTxtIdentificationNo0(), getTxtJointNo0(), getTxtWelderNo0(), getTxtSegment0(),	getTxtFlimSize0(), getTxtDensity0(), getTxtSensitivity0(), getLovObservation0());
		radiographicweldreportpage.validateConfimationEdit();
	}

	@AfterClass
	public void tearDownone() throws Exception {
		radiographicweldreportpage.clickLogout();
	}

}
