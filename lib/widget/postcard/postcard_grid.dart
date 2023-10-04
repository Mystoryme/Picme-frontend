import 'package:flutter/material.dart';

class PostCardGrid extends StatefulWidget {
  const PostCardGrid({super.key});

  @override
  State<PostCardGrid> createState() => _PostCardGridState();
}

class _PostCardGridState extends State<PostCardGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: GridView.builder(
          itemCount: 6,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sunset.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 194.5,
              ),
            );
          }),
    );
  }
}
