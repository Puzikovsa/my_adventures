import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_adventures/models/place.dart';
import 'package:my_adventures/pages/add_place_page.dart';
import 'package:my_adventures/pages/place_list_page.dart';
import 'package:my_adventures/providers/my_places.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Place>(PlaceAdapter());
  Hive.registerAdapter<PlaceLocation>(PlaceLocationAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MyPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Мои приключения',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: const PlaceListPage(),
        routes: {
          AddPlacePage.rout: (context) => const AddPlacePage(),
        },
      ),
    );
  }
}
