import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/post.dart';
import 'package:picme/widget/home/home_dropdown.dart';
import 'package:picme/widget/postcard/postcard.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Post>? posts;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() {
    Caller.dio.get("/post/list").then((response) {
      setState(() {
        posts = response.data["data"]["posts"]
            .map<Post>((e) => Post.fromJson(e))
            .toList();
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (posts == null) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator()],
      );
    }

    return Column(
      children: [
        Home_navbar(),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: posts!
                .map((el) => PostCard(
                      post: el,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
