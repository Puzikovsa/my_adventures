import 'package:flutter/material.dart';

class PlaceListPage extends StatelessWidget{
  const PlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои места'),
        actions: [
          IconButton(onPressed: () {},
              icon: const Icon(Icons.add)),
        ],
      ),
      body: const Center(
        child: Text('Приложение в разработке'),
      ),
    );
  }
}