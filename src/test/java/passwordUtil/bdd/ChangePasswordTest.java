package passwordUtil.bdd;

import org.junit.Assert;
import passwordUtil.ChangePasswordUtility;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ChangePasswordTest {
	
	private String result;
	private ChangePasswordUtility chpass ;
	
	public ChangePasswordTest(){
		try{
			chpass = new ChangePasswordUtility();
		}catch(Exception ex){
			System.out.println("Execution Failed: "+ex.getMessage());
			System.exit(0);
		}
	}

@When("^user provides OldPassword as \"(.*?)\" and NewPassword as \"(.*?)\"$")
public void user_provides_OldPassword_as_and_NewPassword_as(String oldPassword, String newPassword) throws Throwable {
	result = "";
	try{
		result = chpass.ChangePassword(oldPassword, newPassword);
	}
	catch(Exception ex){
		throw new Exception("Could not input Passwords: "+ex);
	}
}

@Then("^result as \"(.*?)\" should be returned$")
public void result_as_should_be_returned(String output) throws Throwable {
	try{
		Assert.assertEquals(output, result);
	}
	catch(AssertionError ex){
	    throw new Exception("Actual Output: "+result);
	}
}

}
