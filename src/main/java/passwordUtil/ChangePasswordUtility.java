package passwordUtil;

import java.io.FileNotFoundException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ChangePasswordUtility {
	private Pattern patternComp;
	private Matcher patternMatcher; 
	private MockPasswordRepo mockPasswords;
	private DictionaryRepo dictionary;
		
	public ChangePasswordUtility() throws Exception{
	   mockPasswords = new MockPasswordRepo();
	   dictionary = DictionaryRepo.getInstance();
	}

	public String ChangePassword(String oldPassword,String newPassword){
		if(!mockPasswords.checkIfOldPasswordExists(oldPassword))
			return "Old Password does not match with the system";
		
		if(mockPasswords.checkIfNewPasswordIsSame(oldPassword, newPassword))
			return "New Password is same as last 2 old passwords";
		
		else if(newPassword.length()<12)
			return "New Password should contain atleast 12 alphanumeric characters";
		
		else if (!verifyOnlyAllowedSpecialCharacters(newPassword))
			return "Only special characters !@#$&*+<=> are allowed";
		
		else if (!verifyPasswordIsAlphaNumeric(newPassword))
			return "New Password should contain at least 1 Upper case, 1 lower case , 1 numeric, 1 special character";
		
		else if (!verifyRepeatingCharactersNotPresent(newPassword))
			return "New Password should not contain more than 4 identical characters in a row";
		
		else if (dictionary.checkIfPasswordExistsInDictionary(newPassword))
			return "New Password should not be a dictionary word";
		
		else if (verifyIfNumberSequenceIsPresent(newPassword))
			return "New Password should not contain any number sequence";
		
		else
			return "Password updated successfully";
	
	}
	
	private boolean verifyPasswordIsAlphaNumeric(String newPassword){
		String pattern1 = "(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$&*+<=>])";
		patternComp= Pattern.compile(pattern1);
		patternMatcher = patternComp.matcher(newPassword);
		
		if (patternMatcher.find())
			return true;
					
		return false;
	}
	
	private boolean verifyOnlyAllowedSpecialCharacters(String newPassword){
		String pattern1 ="[a-zA-Z0-9!@#$&*+<=>]";
		patternComp= Pattern.compile(pattern1);
		patternMatcher = patternComp.matcher(newPassword);
		int count = 0;
		while (patternMatcher.find())
		    count++;
		
		if (count==newPassword.length())
			return true;
		
		return false;
	}
	
	private boolean verifyRepeatingCharactersNotPresent(String newPassword){
		String pattern1 ="(.)\\1{4,}";
		patternComp= Pattern.compile(pattern1);
		patternMatcher = patternComp.matcher(newPassword);
		if (patternMatcher.find())
			return false;
					
		return true;
	}
	
	private boolean verifyIfNumberSequenceIsPresent(String newPassword){
		String[] sequence= new String[]{"012","123","234","345","456","567","678","789"}; 
		for(int i=0; i<sequence.length; i++){
			if(newPassword.contains(sequence[i]))
				return true;
		}
		return false;
	}
	
	public static void main(String[] args) throws Exception {
		try{
			if(args.length<2)
	     		throw new Exception("Please provide OldPassword and NewPassword");
		
		String oldPassword= args[0];
		String newPassword= args[1];
		ChangePasswordUtility ch = new ChangePasswordUtility();
		String result= ch.ChangePassword(oldPassword, newPassword);
		System.out.println(result);
		}catch(Exception ex){
			System.out.println("Execution Failed: "+ ex.getMessage());	
		}
			
	}


}
