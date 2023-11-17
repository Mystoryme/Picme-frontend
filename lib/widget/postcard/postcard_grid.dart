import 'package:flutter/material.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/gridposts.dart';

class PostCardGrid extends StatefulWidget {
  const PostCardGrid({Key? key, required this.posts}) : super(key: key);
  final GridPosts posts;

  @override 
  State<PostCardGrid> createState() => _PostCardGridState();
}

class _PostCardGridState extends State<PostCardGrid> {
  GridPost? post;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: GridView.builder(
          itemCount: widget.posts.posts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1.5, crossAxisSpacing: 1.5),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.posts.posts[index].imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
              height: 194.5,
            );
          }),
    );
  }
}