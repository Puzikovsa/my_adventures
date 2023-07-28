import 'package:flutter/material.dart';
import 'package:my_adventures/providers/my_places.dart';
import 'package:provider/provider.dart';

import 'add_place_page.dart';

class PlaceListPage extends StatelessWidget {
  const PlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Мои места'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlacePage.rout);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Consumer<MyPlaces>(
          builder: (context, myPlaces, child) => myPlaces.items.isEmpty
              ? child!
              : ListView.builder(
                  itemCount: myPlaces.items.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(myPlaces.items[index].title),
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundImage: FileImage(myPlaces.items[index].image),
                    ),
                  ),
                ),
          child: const Text(
            'Не найдено ни одного места\nДобавьте новое',
            textAlign: TextAlign.center,
          ),
        ));
  }
}
