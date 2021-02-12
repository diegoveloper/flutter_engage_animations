import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details_screen.dart';
import 'place.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Place> _places;

  Future<void> _loadingData() async {
    final response = await http.get('http://www.json-generator.com/api/json/get/bUbsitaEaG?indent=2');
    setState(() {
      _places = placeFromJson(response.body);
    });
  }

  @override
  void initState() {
    _loadingData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Event'),
        actions: [],
      ),
      body: _places != null
          ? AnimatedSwitcher(
              duration: const Duration(milliseconds: 1400),
              child: HomeListView(
                places: _places,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({Key key, @required this.places}) : super(key: key);
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return HomeItem(
          place: places[index],
        );
      },
      itemExtent: 200,
      itemCount: places.length,
    );
  }
}

class HomeGridView extends StatelessWidget {
  const HomeGridView({Key key, @required this.places}) : super(key: key);
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) {
        return HomeItem(
          place: places[index],
        );
      },
      itemCount: places.length,
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({Key key, this.place}) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsScreen(place: place),
          ),
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              place.image,
              fit: BoxFit.cover,
              loadingBuilder: (_, widget, chunk) {
                return chunk == null
                    ? widget
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 0,
            child: Text(
              place.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(5, 2),
                    spreadRadius: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
