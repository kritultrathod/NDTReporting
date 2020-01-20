package testCaseForNdt;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import BasePages.SignUpPage;

public class TC_signup extends SignUpPage{
	SignUpPage signuppage = new SignUpPage();


	@BeforeClass
	public void setupone(){
		System.out.println("Test Case for sign up to begin");
		signuppage.NavigateToNdtUrl();
		signuppage.validateloginpageelements();
	}

	@Test
	public void ValidateSignUpForm() throws Exception {
		signuppage.FillSignUpForm(getTxtemailid(), getTxtpassword(), getTxtconfirmpassword(), getTxtcompanyname(), getTxtyourname(), getTxtmobilenumber(), getLovsecurityquestion(),getTxtsecurityanswer());
	}

}
