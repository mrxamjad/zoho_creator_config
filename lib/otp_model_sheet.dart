import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

enum Otptype {
  email,
  phone,
}

showOtpModalSheet(BuildContext context,
    {required Otptype otptype,
    required String otp,
    required String username,
    required String sentTime}) {
  OtpFieldController? _otpcontroller;

  String validationType = "";

  if (otptype == Otptype.email) {
    validationType = "email address";
  } else {
    validationType = "phone number";
  }

  showModalBottomSheet(
      backgroundColor: Colors.grey.shade900,
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Verify you $validationType",
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
                const Text(
                  "OTP sent to email adress",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                OTPTextField(
                  length: 6,
                  controller: _otpcontroller,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 44,
                  otpFieldStyle: OtpFieldStyle(
                    focusBorderColor: Colors.teal,
                    backgroundColor: Colors.grey.shade800,
                  ),
                  outlineBorderRadius: 10,
                  fieldStyle: FieldStyle.box,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't get OTP Code?",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 10),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    if (otp == _otpcontroller.toString()) {
                      print("Verification successfull");
                      Navigator.pop(context);
                    } else {
                      print("Verifaication unsuccessful");
                    }
                  },
                  child: const Text(
                    'Verify OTP',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Request code again  ",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Text(
                      "00:55s",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        );
      });
}
