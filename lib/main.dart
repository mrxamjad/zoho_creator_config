import 'package:flutter/material.dart';
import 'package:zoho_creator_config/service_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EV Bike Service Scheduler',
      home: HomePage(),
    );
  }
}
