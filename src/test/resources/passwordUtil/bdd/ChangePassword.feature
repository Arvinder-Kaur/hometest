@ChangePasswordTest
Feature: Test Change Password function

  Scenario: System Checks--> Old Password does not match with system
    When user provides OldPassword as "Alphanum124@7" and NewPassword as "Alphanum124@9"
    Then result as "Old Password does not match with the system" should be returned

  Scenario: System Checks--> Old Password matches with system and New Password is same as current Old password
    When user provides OldPassword as "Alphanum125@9" and NewPassword as "Alphanum125@9"
    Then result as "New Password is same as last 2 old passwords" should be returned

  Scenario: System Checks--> Old Password matches with system and New Password is same as previous Old password
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphanum124@8"
    Then result as "New Password is same as last 2 old passwords" should be returned

  Scenario: System Checks--> Old Password matches with system and New Password is not same as current or previous Old Password
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphanum124@7"
    Then result as "Password updated successfully" should be returned

  Scenario: SPassword Length and Character Checks--> New Password is of length 11
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alpha123@71"
    Then result as "New Password should contain atleast 12 alphanumeric characters" should be returned

  Scenario: Password Length and Character Checks--> New Password is of length 12 and all required characters are present atleast once and starts with Upper case character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "AlphaNum@12&"
    Then result as "Password updated successfully" should be returned

  Scenario: Password Length and Character Checks--> New Password does not contain any upper case character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "alphanum@12&"
    Then result as "New Password should contain at least 1 Upper case, 1 lower case , 1 numeric, 1 special character" should be returned

  Scenario: Password Length and Character Checks--> New Password does not contain any lower case character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "ALPHANUM@12&"
    Then result as "New Password should contain at least 1 Upper case, 1 lower case , 1 numeric, 1 special character" should be returned

  Scenario: Password Length and Character Checks--> New Password does not contain any numeric character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "AlphaNum@not&"
    Then result as "New Password should contain at least 1 Upper case, 1 lower case , 1 numeric, 1 special character" should be returned

  Scenario: Password Length and Character Checks--> New Password does not contain any special character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "AlphaNum1not2"
    Then result as "New Password should contain at least 1 Upper case, 1 lower case , 1 numeric, 1 special character" should be returned

  Scenario: Password Length and Character Checks--> New Password contains all required characters and a non allowed special character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "AlphaNum&1-22"
    Then result as "Only special characters !@#$&*+<=> are allowed" should be returned

  Scenario: Password Length and Character Checks--> New Password contains all required characters and a space character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alpha Num&122"
    Then result as "Only special characters !@#$&*+<=> are allowed" should be returned

  Scenario: Password Length and Character Checks--> New Password contains all of the allowed special characters and starts with special character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "!@A12#$&g*+<=>"
    Then result as "Password updated successfully" should be returned

  Scenario: Password Length and Character Checks--> New Password contains more than one numbers and starts with number
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "12Alpha744#$&"
    Then result as "Password updated successfully" should be returned

  Scenario: Password Length and Character Checks--> New Password is of length more than 12, contains more than one lower case character and starts with lower case character
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "ab12Alphanum#$&"
    Then result as "Password updated successfully" should be returned

  Scenario: Repeating Characters--> New Password contains 4 repeating characters
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphannnn12@7"
    Then result as "Password updated successfully" should be returned

  Scenario: Repeating Characters--> New Password contains 5 repeating characters
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alpha11111@7"
    Then result as "New Password should not contain more than 4 identical characters in a row" should be returned

  Scenario: Repeating Characters--> New Password contains more than 5 repeating characters
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alpha1@@@@@@7"
    Then result as "New Password should not contain more than 4 identical characters in a row" should be returned

  Scenario: Repeating Characters--> New Password contains 5 distributed repeating characters
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alpha11@1117"
    Then result as "Password updated successfully" should be returned

  Scenario: Dictionary Checks--> New Password is of length 14 and a word in dictionary
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "11th&12thGrade"
    Then result as "New Password should not be a dictionary word" should be returned

  Scenario: Dictionary Checks--> New Password is of length 13 and a word in dictionary
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "9th&12thGrade"
    Then result as "New Password should not be a dictionary word" should be returned

  Scenario: Dictionary Checks--> New Password is of length 15 and a word in dictionary
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "11th&12thGrades"
    Then result as "Password updated successfully" should be returned

  Scenario: Dictionary Checks--> New Password is of length 14 and not a word in dictionary
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alpha11@1117"
    Then result as "Password updated successfully" should be returned

  Scenario: Number Sequence--> New Password contains continuous Number Sequence of length 3
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphanum123@7"
    Then result as "New Password should not contain any number sequence" should be returned

  Scenario: Number Sequence--> New Password contains continuous Number Sequence of maximum length
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "A123456789@num"
    Then result as "New Password should not contain any number sequence" should be returned

  Scenario: Number Sequence--> New Password contains continuous Number Sequence starting with zero
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphanum012m@"
    Then result as "New Password should not contain any number sequence" should be returned

  Scenario: Number Sequence--> New Password contains 3 or more continuous Numbers but not a Sequence
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphanum5719m@"
    Then result as "Password updated successfully" should be returned

  Scenario: Number Sequence--> New Password contains continuous Number Sequence of length 2 and distributed Number Sequence of length 3
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphanu12m@3"
    Then result as "Password updated successfully" should be returned

  Scenario: Number Sequence--> New Password does not contain any Number Sequence of length 3 or more
    When user provides OldPassword as "Alphanum124@9" and NewPassword as "Alphanum01m@"
    Then result as "Password updated successfully" should be returned
