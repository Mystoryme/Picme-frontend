import 'package:flutter/material.dart';
import 'package:picme/models/boost.dart';
import 'package:picme/models/boosts.dart';
import 'package:picme/models/post.dart';
import 'package:picme/pages/post_click_page.dart';

class GridPhoto extends StatefulWidget {
  const GridPhoto({Key? key, required this.posts}) : super(key: key);
  final Boosts posts;

  @override
  State<GridPhoto> createState() => _GridPhotoState();
}

class _GridPhotoState extends State<GridPhoto> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        itemCount: widget.posts.posts?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      PostClickPage(postId: widget.posts.posts[index].postId), // Replace with your page
                ),
              );
            },
            child: Image.network(
              widget.posts.posts?[index]?.imageUrl ?? '',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
