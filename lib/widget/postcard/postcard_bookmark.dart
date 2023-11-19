import 'package:flutter/material.dart';
import 'package:picme/models/bookposts.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/gridposts.dart';
import 'package:picme/pages/book_click_page.dart';

class PostCardBook extends StatefulWidget {
  const PostCardBook({Key? key, required this.posts}) : super(key: key);
  final BookPosts posts;

  @override
  State<PostCardBook> createState() => _PostCardBookState();
}

class _PostCardBookState extends State<PostCardBook> {
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
                  builder: (context) => BookClickPage(
                    postId: widget.posts.posts[index].postId,
                  ),
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
    // return Container(
    //   width: double.maxFinite,
    //   height: double.maxFinite,
    //   child: GridView.builder(
    //       itemCount: widget.posts.posts.length,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 3, mainAxisSpacing: 1.5, crossAxisSpacing: 1.5),
    //       itemBuilder: (context, index) {
    //         return Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: NetworkImage(widget.posts.posts[index].imageUrl),
    //               fit: BoxFit.contain,
    //             ),
    //           ),
    //           height: 194.5,
    //         );
    //       }),
    // );
  }
}
