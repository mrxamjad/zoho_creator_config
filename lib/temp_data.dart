// ignore_for_file: public_member_api_docs, sort_constructors_first
class TempData {
  List<EmailVerificationDataModel> emailVerificationList = [];
}

class EmailVerificationDataModel {
  String email;
  String otp;
  String sentTime;
  String? verifiedTime;
  String? staus;
  EmailVerificationDataModel({
    required this.email,
    required this.otp,
    required this.sentTime,
    this.verifiedTime,
    this.staus,
  });
}
