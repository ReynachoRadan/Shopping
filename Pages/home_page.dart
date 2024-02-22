import 'package:flutter/material.dart';
import 'item_page.dart';
import 'list_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [
    {
      'name': 'Apel',
      'price': 20.0,
      'imageUrl': 'https://image-url.com/apel.jpg'
    },
    {
      'name': 'Jeruk',
      'price': 15.0,
      'imageUrl': 'https://image-url.com/jeruk.jpg'
    },
    {
      'name': 'Semangka',
      'price': 35.0,
      'imageUrl': 'https://image-url.com/semangka.jpg'
    },
  ];

  String userName = 'Guest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                items.clear();
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Welcome, $userName!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                if (result != null && result is String) {
                  setState(() {
                    userName = result;
                  });
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                elevation: 4.0,
                child: ListPage(items: items), // Memperbarui bagian ini
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/item');
          if (result != null && result is Map<String, dynamic>) {
            setState(() {
              items.add(
                // Menambahkan URL gambar bersama dengan data item
                {
                  'name': result['name'],
                  'price': result['price'],
                  'imageUrl': result['imageUrl'],
                },
              );
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
