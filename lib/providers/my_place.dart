import 'package:flutter/cupertino.dart';

import '../models/place.dart';

class MyPlace with ChangeNotifier{

  List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }
}