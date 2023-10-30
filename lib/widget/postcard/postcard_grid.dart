import 'package:flutter/material.dart';
import 'package:picme/models/gridpost.dart';

class PostCardGrid extends StatefulWidget {
  const PostCardGrid({Key? key, required this.post, required this.postcount})
      : super(key: key);
  final GridPost post;
  final int postcount;

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
          itemCount: widget.postcount,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.post.imageUrl),
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
