import 'package:flutter/material.dart';

class GridPhoto extends StatelessWidget {
  final List<Image> myImagesAdapted = [
    Image(
      image: AssetImage('assets/arisu.t.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/esterbunny.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/pudding.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/ra_rabitty.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/sunset.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/yuri_iii.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/arisu.t.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/esterbunny.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/pudding.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/ra_rabitty.jpeg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/sunset.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/yuri_iii.jpeg'),
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:
              1.0, // You can adjust this value to change aspect ratio
        ),
        itemCount: myImagesAdapted.length,
        itemBuilder: (context, index) {
          return myImagesAdapted[index];
        },
      ),
    );
  }
}

