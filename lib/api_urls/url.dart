class URls {
  static String baseUrl = 'https://care2carevital.us';

  String loginorsignup = '$baseUrl/api/caretaker/login-or-register';

  String checkOtp = '$baseUrl/api/caretaker/verify-otp';

  String profileDetailsInsert = '$baseUrl/api/caretaker/caretaker-info/add';

  String profileDetailsEdit = '$baseUrl/api/caretaker/caretaker-info/edit';

  String careTakerInfo = '$baseUrl/api/caretaker/caretaker/view';

  String viewAllCareTakers = '$baseUrl/api/caretaker/caretaker/viewall';

  String uploadImage = '$baseUrl/api/caretaker/caretaker/profile-img-upload';

  String uploadDoc  = '$baseUrl/api/caretaker/caretaker/documents-upload';

  String delDoc = '$baseUrl/api/caretaker/caretaker-info/delete';

  String individualPatient = '$baseUrl/api/caretaker/caretaker/view-patient';

  String viewRequests = '$baseUrl/api/caretaker/caretaker/appointment-requests';

  String acceptRejectPatientRequest = '$baseUrl/api/caretaker/caretaker/approve-appointment';
}
