import 'package:absens_clone_app/Screens/AddItemsScrens.dart';
import 'package:absens_clone_app/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ManageProduct extends StatefulWidget {
  const ManageProduct({super.key});

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Naviguer vers la page d'ajout/modification
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
          ),
        ],
      ),
      body: Consumer<MyProvider>(
        builder: (context, value, child) {
          final _product = value.produit;
          return ListView.builder(
            itemCount: _product.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) =>
                    value.deleteProduct(_product[index]),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  title: Text(_product[index].name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                InputPage(product: _product[index])));
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
