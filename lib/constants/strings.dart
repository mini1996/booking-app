class Strings {
  Strings._();

  //General
  static const String appName = "UNSWORTH";

  static const String errorMessage =
      "Some error has occurred. Please try again later";
  static const String internetNotAvailable =
      "Please check your internet connection";
  static const String fillRequiredField = "Please fill all required field";

  //Login
  static const String loginButton = "Login";
  static const String usernameEmptyMessage = 'Please enter email';
  static const String passwordEmptyMessage = 'Please enter password';

  static const String nextButton = "Next";
  static const String forgotPasswordButton = "Forgot password ?";
  static const String usernameLabel = "User Email";
  static const String passwordLabel = "Password";

  static const String resendOtp = "Resend SMS";
  static const String verifyOtpTitle = "Verifying your number";
  static const String verifyOtpMessage =
      "Please type the verification code sent to ";
  static const String verifyOtpLabel = "Verify Otp";
  static const String editNumber = "edit number";
  static const String otpSentMessage = "Otp has been sent successfully.";
  static const String otpResendLabel = "Didn't get the otp? ";

  static const String proceedButton = "Proceed";
  static const String submitButton = "Submit";
  static const String cancelButton = "Cancel";
  static const String inviteDialogTitle = "Invite participants?";
  static const String inviteDialogMessage =
      "An invitation will be sent to the selected participants.";
  static const String groupsEmpty = "Create or join a group to get started";
  static const String noOfUsers =
      " people from your contacts have joined " + appName;
  static const String noContactsMessage = "Unable to fetch contacts";
  static const String noMembersInGroupMessage =
      "Unable to fetch participants from group";

  static const String groupNameHint = "Please enter a name";
  static const String groupDescriptionHint = "Please enter a description";
  static const String groupNameLabel = "Name";
  static const String groupDescriptionLabel = "Description";
  static const String atleastOneParticipantMessage =
      "Please select atleast one participant";
  static const String groupCreationSuccessMessage =
      "Group created successfully";

  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';

  static const String trustGroupsEmpty = 'No trust group available.';
  static const String trustGroupMessage =
      'The trust group will be started once the number of members joined reach ';

  static const String searchHint = 'Search...';
  static const String nameLabel = 'Name';
  static const String nameHint = 'Please enter your name';

  static const String fetchingBookings = 'Fetching Bookings...';
  static const String fetchingContainers = 'Fetching Containers...';
  static const String fetchingSuccess = "Fetching Successful";
  static const String storingBookings = 'Bookings...';
  static const String storingContainers= 'Containers...';
  static const String fetchingUserCount = 'Fetching user count';
  static const String storingUserCount = 'Storing user count';
  static const String errorTemplate = 'Some error has occured while ';

  // MAIN SCREEN
  static const String stage_1 = 'DUE TO ARRIVE';
  static const String stage_2 = 'IN WAREHOUSE';
  static const String stage_3 = 'LOADING';
  static const String stage_4 = 'CONTAINERS';

  static const String inWareHouseMessage = '“WAITING FOR OPERATIONS TO PASS VEHICLE ON LOADING STAGE”';
  static const String loadingMessage = '“WAITING FOR OPERATIONS TO APPROVE PHOTOS”';

  static const String imageLimitError =
      'You have exceed the limit, Please delete the image to continue';
}
