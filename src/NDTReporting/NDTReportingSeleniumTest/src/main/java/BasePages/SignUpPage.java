package BasePages;

import ndt_reporting_resuable.Login;
import ndt_reporting_resuable.Navigation;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;
import org.testng.annotations.DataProvider;

public class SignUpPage extends Navigation {
	Login login = new Login();

	private String txtemailid;
	private String txtpassword;
	private String txtconfirmpassword;
	private String txtcompanyname;
	private String txtyourname;
	private String txtmobilenumber;
	private String lovsecurityquestion;
	private String txtsecurityanswer;

	public SignUpPage(){createData_signup();}



	public void FillSignUpForm(String txtemailid, String txtpassword, String txtconfirmpassword, String txtcompanyname, String txtyourname, String txtmobilenumber, String txtsecurityquestion, String txtsecurityanswer) throws InterruptedException, Exception {
		System.out.println("Script for Sign up begins");
		driver.findElement(By.id(SU_REmailIDTextbox)).clear();
		driver.findElement(By.id(SU_REmailIDTextbox)).sendKeys(txtemailid);
		driver.findElement(By.id(SU_RPasswordTextBox)).clear();
		driver.findElement(By.id(SU_RPasswordTextBox)).sendKeys(txtpassword);
		driver.findElement(By.id(SU_ConfirmPasswordTextBox)).clear();
		driver.findElement(By.id(SU_ConfirmPasswordTextBox)).sendKeys(txtconfirmpassword);
		driver.findElement(By.id(SU_RCompanyNameTextBox)).clear();
		driver.findElement(By.id(SU_RCompanyNameTextBox)).sendKeys(txtcompanyname);
		driver.findElement(By.id(SU_RNameTextBox)).clear();
		driver.findElement(By.id(SU_RNameTextBox)).sendKeys(txtyourname);
		driver.findElement(By.id(SU_RMobileNOTextBox)).clear();
		driver.findElement(By.id(SU_RMobileNOTextBox)).sendKeys(txtmobilenumber);
		new Select(driver.findElement(By.id(SU_SQDropDownList))).selectByVisibleText(lovsecurityquestion);
		driver.findElement(By.id(SU_SATextBox)).clear();
		driver.findElement(By.id(SU_SATextBox)).sendKeys(txtsecurityanswer);
		/*driver.findElement(By.id(SU_RSignUpButton)).click();*/

	}

	@DataProvider(name = "sign_up")
	public Object[][] createData_signup() {
		Object[][] retObjArr=getTableArray("resources\\data\\ndt_test_data.xls","sign_up", "TestData");
		this.txtemailid = (String)retObjArr[0][0];
		this.txtpassword = (String)retObjArr[0][1];
		this.txtconfirmpassword = (String)retObjArr[0][2];
		this.txtcompanyname = (String)retObjArr[0][3];
		this.txtyourname = (String)retObjArr[0][4];
		this.txtmobilenumber = (String)retObjArr[0][5];
		this.lovsecurityquestion = (String)retObjArr[0][6];
		this.txtsecurityanswer = (String)retObjArr[0][7];

		return(retObjArr);
	}

	public String getTxtemailid() {return txtemailid;}
	public void setTxtemailid(String txtemailid) {this.txtemailid = txtemailid;}

	public String getTxtpassword() {return txtpassword;}
	public void setTxtpassword(String txtpassword) {this.txtpassword= txtpassword;}

	public String getTxtconfirmpassword() {return txtconfirmpassword;}
	public void setTxtconfirmpassword(String txtconfirmpassword) {this.txtconfirmpassword= txtconfirmpassword;}

	public String getTxtcompanyname() {return txtcompanyname;}
	public void setTxtcompanyname(String txtcompanyname) {this.txtcompanyname= txtcompanyname;}

	public String getTxtyourname() {return txtyourname;}
	public void setTxtyourname(String txtyourname) {this.txtyourname= txtyourname;}

	public String getTxtmobilenumber() {return txtmobilenumber;}
	public void setTxtmobilenumber(String txtmobilenumber) {this.txtmobilenumber = txtmobilenumber;}

	public String getLovsecurityquestion() {return lovsecurityquestion;}
	public void setLovsecurityquestion(String lovsecurityquestion) {this.lovsecurityquestion = lovsecurityquestion;}

	public String getTxtsecurityanswer() {return txtsecurityanswer;}
	public void setTxtsecurityanswer(String txtsecurityanswer) {this.txtsecurityanswer = txtsecurityanswer;}

}
