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
      body: FutureBuilder(
       future: Provider.of<MyPlaces>(context, listen: false).fetchAndSetData(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting ?
          const Center(
            child: CircularProgressIndicator(),
          )
          : Consumer<MyPlaces>(
            child: const Center(
              child: Text(
                'Не найдено ни одного места\nДобавьте новое',
                textAlign: TextAlign.center,
              ),
            ),
            builder: (context, myPlaces, child) => myPlaces.items.isEmpty
                ? child!
                : ListView.builder(
                    itemCount: myPlaces.items.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(myPlaces.items[index].image,
                        ),
                      ),
                      title: Text(myPlaces.items[index].title),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete,
                        color: Colors.red,),
                        onPressed: () {
                          Provider.of<MyPlaces>(context,
                          listen: false).deleteData(myPlaces.items[index]);
                        },
                      ),
                      onTap: () {
                        //TODO: go to detail page...
                      },
                    ),
                  ),
          );
        }
      ),
    );
  }
}
