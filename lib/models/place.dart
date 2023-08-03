import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

part 'place.g.dart';

@HiveType(typeId: 0)
class Place {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final PlaceLocation? location;
  @HiveField(3)
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}

@HiveType(typeId: 1)
class PlaceLocation {
  @HiveField(0)
  final double latitude;
  @HiveField(1)
  final double longitude;
  @HiveField(2)
  final String? address;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
