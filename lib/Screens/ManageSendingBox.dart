import 'package:absens_clone_app/Screens/sendingBoxform.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageSendingBox extends StatefulWidget {
  const ManageSendingBox({super.key});

  @override
  State<ManageSendingBox> createState() => _ManageSendingBoxState();
}

class _ManageSendingBoxState extends State<ManageSendingBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sending Box'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Naviguer vers la page d'ajout/modification
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SendingBoxForm()),
              );
            },
          ),
        ],
      ),
      body: Consumer<MyProvider>(
        builder: (context, value, child) {
          final _box = value.box;
          return ListView.builder(
            itemCount: _box.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) => value.deleteSendingBox(_box[index]),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  title: Text(_box[index].boxName),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SendingBoxForm(box: _box[index])));
                  },
                  trailing: const Icon(Icons.arrow_forward),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
