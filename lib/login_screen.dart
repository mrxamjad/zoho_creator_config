import 'package:flutter/material.dart';
import 'package:zoho_creator_config/login_with_email_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
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
                const Text(
                    "Please confirm your country code and enter your mobile number",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "+91",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.2, color: Colors.grey.shade500),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _phoneNumberController,
                              enableSuggestions: true,
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.teal,
                              maxLength: 10,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Enter your mobile number",
                                  counterText: "",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 11),
                                  border: InputBorder.none),
                              onChanged: (value) {
                                int length = 0;
                                try {
                                  length =
                                      int.tryParse(value).toString().length;
                                } on Exception catch (e) {
                                  // TODO
                                }

                                if (length == 10) {
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
                      onPressed: !isContinue ? null : () {},
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
                                builder: (context) => LoginWithEmailScreen()));
                      },
                      child: const Text(
                        "Or login with email",
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
