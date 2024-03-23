import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:zoho_creator_config/otp_model_sheet.dart';
import 'package:zoho_creator_config/send_mail.dart';
import 'package:zoho_creator_config/temp_data.dart';

import 'login_screen.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool isContinue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: const IconThemeData(),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                // const Text(
                //     "Please confirm your country code and enter your mobile number",
                //     style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.2, color: Colors.grey.shade500),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _emailController,
                              enableSuggestions: true,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.teal,
                              maxLength: 60,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Enter your email address",
                                  counterText: "",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 11),
                                  border: InputBorder.none),
                              onChanged: (value) {
                                isContinue = EmailValidator.validate(
                                    _emailController.text.trim());
                                if (isContinue) {
                                  setState(() {
                                    isContinue = true;
                                  });
                                } else {
                                  setState(() {
                                    isContinue = false;
                                  });
                                }
                              },
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          disabledBackgroundColor: Colors.grey.shade900,
                          // disabledForegroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: !isContinue
                          ? null
                          : () {
                              String otp = generateRandomNumber();
                              EmailVerificationDataModel data =
                                  EmailVerificationDataModel(
                                      email: _emailController.text.trim(),
                                      otp: otp,
                                      sentTime: DateTime.now().toString());

                              TempData().emailVerificationList.add(data);
                              showOtpModalSheet(context,
                                  otp: data.otp,
                                  otptype: Otptype.email,
                                  sentTime: data.sentTime,
                                  username: data.email);

                              sendEmail(
                                  receiver: data.email,
                                  subject: "OTP: DINO RAPTEE",
                                  body: "",
                                  otp: data.otp,
                                  isBody: false);
                            },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: isContinue
                                ? Colors.white
                                : Colors.grey.shade700),
                      )),
                ),
                Center(
                  child: TextButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text(
                        "Or login with mobile number",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            decorationColor: Colors.white,
                            decoration: TextDecoration.underline),
                      )),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "By clicking continue you are agreeing to Raptee accounts User agreement and Privacy policy",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          )
        ],
      )),
    );
  }
}
