import 'package:flutter/material.dart';
import 'package:zoho_creator_config/send_mail.dart';

import 'get_started_page.dart';
import 'schedule_service.dart';
import 'send_mail_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Schedule'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScheduleServiceForm()));
                },
                icon: Icon(Icons.add),
                label: Text("Schedule a Service")),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmailComposer()));
                },
                icon: Icon(Icons.mail),
                label: Text("Send Mail")),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetStartedScreen()));
                },
                icon: Icon(Icons.mail),
                label: Text("Email Verification")),
          ],
        ),
      ),
    );
  }
}
