import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: itemPriceController,
              decoration: InputDecoration(labelText: 'Item Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String itemName = itemNameController.text;
                double itemPrice =
                    double.tryParse(itemPriceController.text) ?? 0.0;
                String imageUrl = imageUrlController.text;

                if (itemName.isNotEmpty &&
                    itemPrice > 0 &&
                    imageUrl.isNotEmpty) {
                  Navigator.pop(context, {
                    'name': itemName,
                    'price': itemPrice,
                    'imageUrl': imageUrl
                  });
                }
              },
              child: Text('Add to List'),
            ),
          ],
        ),
      ),
    );
  }
}
