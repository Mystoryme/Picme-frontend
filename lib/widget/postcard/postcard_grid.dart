import 'package:flutter/material.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/gridposts.dart';
import 'package:picme/pages/grid_click_page.dart';

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
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: widget.posts.posts?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GridClickPage(
                      postId: widget
                          .posts.posts[index].postId, onDelete: () {  },),
                       // Replace with your page
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