import 'package:flutter/material.dart';
import 'package:my_adventures/pages/add_place_page.dart';
import 'package:my_adventures/pages/place_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Мои приключения',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
            .copyWith(secondary: Colors.amber),
      ),
      home: const PlaceListPage(),
      routes: {
        AddPlacePage.rout: (context) => AddPlacePage(),
      },
    );
  }
}
