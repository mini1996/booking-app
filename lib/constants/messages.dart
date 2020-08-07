class Messages {
  Messages._();

  static const INTERNET_CONNECTION_FAILURE =
      "Check your internet connection and try again";
  static const SIGNUP_MOBILE_NUMER_MISSING = "Please enter the Mobile Number";
  static const SIGNUP_MOBILE_NUMER_INVALID =
      "Please enter a valid Mobile Number";
  static const SIGNUP_NAME_MISSING = "Please enter the Name";
  static const SIGNUP_NAME_INVALID = "Please enter a valid Name";
  static const SIGNUP_EMAIL_MISSING = "Please enter an E-Mail address";
  static const SIGNUP_EMAIL_INVALID = "Please enter a valid E-Mail address";
  static const SIGNUP_PASSWORD_MISSING = "Please enter a password";
  static const SIGNUP_CONFIRM_PASSWORD_MISSING =
      "Please enter confirm password";
  static const SIGNUP_PWD_CONFIRM_PWD_NOTMATCHING =
      "Both passwords should match";
  static const SIGNUP_USER_EXISTS =
      "User with this mobile number already exists. Signup with different mobile number";
  static const SIGNUP_SUCCESSFUL =
      "User has been created successfully. OTP has been sent.";
  static const SIGNUP_OTP_EMPTY = "Please enter OTP";
  static const SIGNUP_OTP_MISMATCH = "Incorrect OTP, try again";
  static const SIGNUP_ACCOUNT_LOCKED =
      "Incorrect OTP, please select Resend OTP";
  static const GROUP_NAME_EMPTY = "Please enter group name";
  static GROUP_NAME_EXISTS(String groupName) {
    return "Group name $groupName already exists, please use another name";
  }

  static const GROUP_NAME_CREATED = "Group %group name% has been created";
  static const TRUST_GROUP_NAME_EMPTY = "Please enter trust group name";
  static const TRUST_GROUP_AMOUNT_EMPTY = "Please select trust group amount";
  static const TRUST_GROUP_TENURE_EMPTY = "Please select trust group tenure";
  static const TRUST_GROUP_PARTICIPANT_COUNT_EMPTY =
      "Please select participant count";
  static const TRUST_GROUP_PERIODICAL_EMPTY = "Please select periodical";
  static const TRUST_GROUP_NAME_EXISTS =
      "Trust group name %trust name% already exists, please use another name";
  static const TRUST_GROUP_NAME_CREATED =
      "Trust group %trust name% has been created";
}
