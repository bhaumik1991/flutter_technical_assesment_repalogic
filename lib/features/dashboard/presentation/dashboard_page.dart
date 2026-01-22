import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final List<Map<String, dynamic>> items = [
    {
      'title': 'Weather',
      'route': '/weather',
      'icon': Icons.cloud,
      'colors': [Colors.blue, Colors.lightBlueAccent],
    },
    {
      'title': 'To-Do',
      'route': '/todo',
      'icon': Icons.check_circle,
      'colors': [Colors.green, Colors.teal],
    },
    {
      'title': 'Game',
      'route': '/game',
      'icon': Icons.games,
      'colors': [Colors.purple, Colors.deepPurpleAccent],
    },
    {
      'title': 'Products',
      'route': '/products',
      'icon': Icons.shopping_cart,
      'colors': [Colors.orange, Colors.deepOrangeAccent],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Flutter Mini Apps',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, i) {
          final item = items[i];

          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () =>
                Navigator.pushNamed(context, item['route'] as String),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: item['colors'],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(
                      item['icon'],
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    item['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
