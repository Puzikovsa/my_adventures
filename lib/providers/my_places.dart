import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:my_adventures/core/hive_helper.dart';
import '../models/place.dart';

class MyPlaces with ChangeNotifier{

  List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) async {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: null,
        image: pickedImage,
    );
    _items.add(newPlace);
    (await HiveHelper.getDB<Place>('user_places')).add(newPlace);
    notifyListeners();
  }

  Future<void> fetchAndSetData()async {
    var db = await HiveHelper.getDB<Place>('user_places');
    _items = db.values.toList();
  }

  Future<void> deleteData(Place place)async {
    var db = await HiveHelper.getDB<Place>('user_places');
    if(_items.contains(place)) {
      db.deleteAt(_items.indexOf(place));
      _items.remove(place);
    }
    notifyListeners();
  }

  Future<void> updateData(int index,Place newPlace)async {
    var db = await HiveHelper.getDB<Place>('user_places');
    if(index < _items.length) {
      db.putAt(index, newPlace);
      _items.removeAt(index);
      _items.insert(index, newPlace);
    }
    notifyListeners();
  }
}