import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final List<Map<String, dynamic>> items; // Mengubah tipe data items

  ListPage({required this.items});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void _removeItem(String itemName) {
    setState(() {
      widget.items.removeWhere(
          (item) => item['name'] == itemName); // Ubah cara menghapus item
    });
  }

  void _showItemDescription(
      String itemName, double itemPrice, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(itemName),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price: \$${itemPrice.toString()}'),
              SizedBox(height: 10),
              Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = widget.items.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Item list'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Items: $totalItems',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                var itemName =
                    widget.items[index]['name']; // Mengakses nama item
                var itemPrice =
                    widget.items[index]['price']; // Mengakses harga item
                var imageUrl =
                    widget.items[index]['imageUrl']; // Mengakses URL gambar

                return ListTile(
                  title: Text('$itemName'),
                  subtitle: Text('Price: \$${itemPrice.toString()}'),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl), // Menggunakan URL gambar
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removeItem(itemName);
                    },
                  ),
                  onTap: () {
                    _showItemDescription(itemName, itemPrice,
                        imageUrl); // Menyertakan harga saat memanggil fungsi
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
