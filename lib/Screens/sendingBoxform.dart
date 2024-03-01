import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/main.dart';
import 'package:flutter/material.dart';

class SendingBoxForm extends StatefulWidget {
  @override
  _SendingBoxFormState createState() => _SendingBoxFormState();
}

class _SendingBoxFormState extends State<SendingBoxForm> {
  final _formKey = GlobalKey<FormState>();
  String boxName = '';
  int npd = 0;
  int dbmp = 0;
  int cv = 0;
  double tc = 0.0;
  double cm = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Sending Box"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Box Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the box name';
                }
                return null;
              },
              onSaved: (value) {
                boxName = value!;
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Nombre of data port'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the number of data ports';
                }
                return null;
              },
              onSaved: (value) {
                npd = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Supply voltage'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the number of Supply voltage';
                }
                return null;
              },
              onSaved: (value) {
                tc = double.parse(value!);
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Maximum bit rate per port'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Maximum bit rate per port';
                }
                return null;
              },
              onSaved: (value) {
                dbmp = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Video Compression'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Video Compression';
                }
                return null;
              },
              onSaved: (value) {
                cv = int.parse(value!);
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Maximum current ...'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Maximum current ...';
                }
                return null;
              },
              onSaved: (value) {
                cm = double.parse(value!);
              },
            ),
            // Add similar form fields for dbmp, cv, tc, and cm
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Use the collected data to create a SendingBox object
                  SendingBox sendingBox = SendingBox(
                    dbmp: dbmp,
                    boxName: boxName,
                    tc: tc,
                    cm: cm,
                    cv: cv,
                    npd: npd,
                  );
                  MyHomePage.boxs.add(sendingBox);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
