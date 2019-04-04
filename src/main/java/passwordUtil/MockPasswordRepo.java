package passwordUtil;

import java.util.HashMap;

public class MockPasswordRepo {
 private static HashMap<String,String> oldpasswords= new HashMap<String, String>();
 
 public MockPasswordRepo(){
	 oldpasswords.put("Alphanum124@9", "Alphanum124@8");
	 oldpasswords.put("Alphanum125@9", "Alphanum124@8");
	 oldpasswords.put("Alphanum129@9", "Alphanum129@8");
 }
 
 public boolean checkIfOldPasswordExists(String olPassword){
	if(oldpasswords.containsKey(olPassword))
		return true;
	return false;
 }
 
 public boolean checkIfNewPasswordIsSame(String oldPassword,String newPassword){
	 if (newPassword.equals(oldPassword))
		 return true;
	 String previousOldPassword =oldpasswords.get(oldPassword);
	 if (newPassword.equals(previousOldPassword))
		 return true;
	return false;
 }
 
}
