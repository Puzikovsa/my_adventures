import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../core/location_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getPreviewImageUrl(
    double latitude,
    double longitude,
  ) async {
    setState(() {
      _previewImageUrl = LocationHelper.generateLocationPreviewImage(
          latitude: latitude, longitude: longitude);
    });
  }

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    if (locationData.latitude == null || locationData.longitude == null) return;

    _getPreviewImageUrl(locationData.latitude!, locationData.longitude!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? const Text('Местоположение не выбрано')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: const Icon(Icons.location_on),
                label: const Text(
                  'Мое местоположение',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text(
                  'Выбрать на карте',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
