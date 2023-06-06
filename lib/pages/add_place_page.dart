import 'package:flutter/material.dart';

class AddPlacePage extends StatelessWidget{
  static const String rout = '/add_place';
  const AddPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Добавить место'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
            ),
          ))
        ],
      ),
    );
  }

}