import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScheduleServiceForm extends StatefulWidget {
  @override
  _ScheduleServiceFormState createState() => _ScheduleServiceFormState();
}

class _ScheduleServiceFormState extends State<ScheduleServiceForm> {
  final _formKey = GlobalKey<FormState>();
  String _applicantName = '';
  String _serviceType = '';
  String _issueDescription = '';
  XFile? _image;
  String _modeOfService = '';
  String _location = '';
  DateTime? _selectedDate;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Applicant Name'),
            onSaved: (value) => _applicantName = value!,
          ),
          RadioListTile<String>(
            title: Text('Free Service'),
            value: 'Free Service',
            groupValue: _serviceType,
            onChanged: (String? value) {
              setState(() {
                _serviceType = value!;
              });
            },
          ),
          // Add other RadioListTile for other service types
          TextFormField(
            decoration: InputDecoration(labelText: 'Issue Description'),
            maxLines: 5,
            onSaved: (value) => _issueDescription = value!,
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Pick Image'),
          ),
          // Add RadioListTile for Mode of Service
          // Add TextFormField for location if not SelfDrop
          // Add DatePicker for date and time
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Handle form submission
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class ScheduledServicesList extends StatelessWidget {
  final List<String> services = [
    'Service 1',
    'Service 2',
    // Add more services
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(services[index]),
          // Add more details about the service
        );
      },
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EV Bike Service Scheduler'),
        ),
        body: ScheduledServicesList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the form
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
