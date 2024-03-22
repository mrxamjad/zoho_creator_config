import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScheduleServiceForm extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ScheduleServiceFormState createState() => _ScheduleServiceFormState();
}

class _ScheduleServiceFormState extends State<ScheduleServiceForm> {
  final _formKey = GlobalKey<FormState>();
  String _applicantName = '';
  String _serviceType = 'Free Service';
  String _issueDescription = '';
  XFile? _imageFile;
  String _serviceMode = 'Self Drop';
  String _location = '';
  String _dealerId = '';
  DateTime? _selectedDateTime;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Applicant Name',
                  ),
                  onSaved: (value) {
                    _applicantName = value!;
                  },
                ),
                RadioListTile(
                  title: const Text('Free Service'),
                  value: 'Free Service',
                  groupValue: _serviceType,
                  onChanged: (value) {
                    setState(() {
                      _serviceType = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('General Service'),
                  value: 'General Service',
                  groupValue: _serviceType,
                  onChanged: (value) {
                    setState(() {
                      _serviceType = value!;
                    });
                  },
                ),
                // Add more RadioListTile for other service types

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Issue Description',
                  ),
                  maxLines: 3,
                  onSaved: (value) {
                    _issueDescription = value!;
                  },
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Pick Image'),
                ),
                if (_imageFile != null)
                  Image.file(
                    File(_imageFile!.path),
                    height: 200,
                  ),
                RadioListTile(
                  title: const Text('Self Drop'),
                  value: 'Self Drop',
                  groupValue: _serviceMode,
                  onChanged: (value) {
                    setState(() {
                      _serviceMode = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Pickup and Drop'),
                  value: 'Pickup and Drop',
                  groupValue: _serviceMode,
                  onChanged: (value) {
                    setState(() {
                      _serviceMode = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('OnSite Service'),
                  value: 'OnSite Service',
                  groupValue: _serviceMode,
                  onChanged: (value) {
                    setState(() {
                      _serviceMode = value!;
                    });
                  },
                ),
                if (_serviceMode != 'Self Drop')
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Location',
                    ),
                    onSaved: (value) {
                      _location = value!;
                    },
                  ),
                // Implement dealer search and selection here
                ElevatedButton(
                  onPressed: () {
                    // Show date and time picker
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((pickedTime) {
                          if (pickedTime != null) {
                            setState(() {
                              _selectedDateTime = DateTime(
                                pickedDate.year,
                                pickedDate.month,
                                pickedDate.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                            });
                          }
                        });
                      }
                    });
                  },
                  child: const Text('Pick Date and Time'),
                ),
                if (_selectedDateTime != null)
                  Text('Selected DateTime: ${_selectedDateTime.toString()}'),
                ElevatedButton(
                  onPressed: () {
                    // Save form data and create service request
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Create service request object and handle submission
                      // ...
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
