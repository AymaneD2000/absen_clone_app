import 'package:absens_clone_app/Models/SendingBox.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:absens_clone_app/main.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SendingBoxForm extends StatefulWidget {
  SendingBox? box;
  SendingBoxForm({this.box});
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
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.box != null) {
      boxName = widget.box!.boxName;
      npd = widget.box!.npd;
      dbmp = widget.box!.dbmp;
      cv = widget.box!.cv;
      tc = widget.box!.tc;
      cm = widget.box!.cm;
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatModel = Provider.of<MyProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Sending Box"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  initialValue: boxName,
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
                  initialValue: npd.toString(),
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
                  initialValue: tc.toString(),
                  decoration:
                      const InputDecoration(labelText: 'Supply voltage'),
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
                  initialValue: dbmp.toString(),
                  decoration: const InputDecoration(
                      labelText: 'Maximum bit rate per port'),
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
                  initialValue: cv.toString(),
                  decoration:
                      const InputDecoration(labelText: 'Video Compression'),
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
                  initialValue: cm.toString(),
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
                Gap(15),
                // Add similar form fields for dbmp, cv, tc, and cm
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
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
                      //MyHomePage.boxs.add(sendingBox);
                      if (widget.box != null) {
                        chatModel.updateSendingBox(sendingBox);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()));
                      } else {
                        chatModel.addSendingBox(sendingBox);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()));
                      }
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
