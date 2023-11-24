import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/homepost.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/widget/home/home_dropdown.dart';
import 'package:picme/widget/postcard/postcard.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomePost? posts;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() {
    String uri = "/post/list";
    if (category != "") {
      uri += "?category=" + category;
    }
    Caller.dio.get(uri).then((response) {
      if (mounted) {
        setState(() {
          posts = HomePost.fromJson(response.data["data"]);
        });
      }
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  String category = "";
  void setCategory(String c) {
    setState(() {
      category = c;
    });
    load();
  }

  reload() {
    load();
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
        Home_navbar(setCategory: setCategory),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: posts!.posts
                .map((el) => PostCard(
                      post: el,
                      reload: reload,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
