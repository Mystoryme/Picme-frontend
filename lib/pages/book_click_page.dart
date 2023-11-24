import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/widget/account_post/head_account_post.dart';
import 'package:picme/widget/postcard/postcard.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';

class BookClickPage extends StatefulWidget {
  const BookClickPage({
    Key? key,
    required this.postId,
  }) : super(key: key);
  static const routeName = "/book_click_page";
  final int postId;

  @override
  State<BookClickPage> createState() => _BookClickPageState();
}

class _BookClickPageState extends State<BookClickPage> {
  Posts? posts;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    // String uri = "/post/post_get";

    Caller.dio.post("/post/post_get", data: {
      "postId": widget.postId,
    }).then((response) {
      setState(() {
        posts = Posts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  reload() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    if (posts == null) {
      return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadAccountPost(),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PostCard(
                    post: posts!.posts[0],
                    reload: reload,
                  ),
                ],
              ),
              // CardNotification(),
            ],
          ),
        ),
      ),
    );
  }
}
