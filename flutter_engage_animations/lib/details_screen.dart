import 'package:flutter/material.dart';

import 'place.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key, this.place}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: place.name,
              child: Image.network(
                place.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 1.0, end: 0.0),
                  curve: Curves.bounceOut,
                  duration: const Duration(milliseconds: 1200),
                  child: Text(
                    place.description,
                  ),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(value * 150, 0.0),
                      child: child,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
