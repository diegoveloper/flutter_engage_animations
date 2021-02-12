import 'package:flutter/material.dart';

import 'place.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key, this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    print(place.image);
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              place.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                place.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
