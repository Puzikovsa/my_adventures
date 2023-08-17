import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget{
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: _previewImageUrl == null ? 
          const Text('Местоположение не выбрано') :
              Image.network(_previewImageUrl !,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
        ),

      ],
    );
  }
}