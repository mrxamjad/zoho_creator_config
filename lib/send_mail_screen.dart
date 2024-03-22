import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:zoho_creator_config/send_mail.dart';

class EmailComposer extends StatefulWidget {
  @override
  _EmailComposerState createState() => _EmailComposerState();
}

class _EmailComposerState extends State<EmailComposer> {
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  String _body = "body";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose Email'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _toController,
                decoration: InputDecoration(
                  labelText: 'To',
                ),
              ),
              TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Subject',
                ),
              ),
              RadioListTile(
                title: const Text('Body'),
                value: 'body',
                groupValue: _body,
                onChanged: (value) {
                  setState(() {
                    _body = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('HTML'),
                value: 'Pickup and Drop',
                groupValue: _body,
                onChanged: (value) {
                  setState(() {
                    _body = value!;
                  });
                },
              ),
              if (_body == "body")
                TextField(
                  controller: _bodyController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: _body == "body" ? 'Body' : ' Html',
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  String otp = generateRandomNumber();

                  sendEmail(
                      receiver: _toController.text,
                      subject: _subjectController.text,
                      body: _bodyController.text,
                      otp: otp,
                      isBody: _body == "body");
                },
                child: Text('Send Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
