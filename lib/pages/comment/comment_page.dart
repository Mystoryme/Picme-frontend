import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/comments.dart';
import 'package:picme/widget/comment/card_comment.dart';
import 'package:picme/widget/comment/head_comment.dart';
import 'package:picme/widget/comment/text_comment.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});
  static const routeName = "/comment_page";

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _search = TextEditingController();
  FocusNode _textFocusNode = FocusNode();
  CommentPosts? comments;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    Caller.dio.get("/comment/list").then((response) {
      setState(() {
        comments = CommentPosts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Column(
                            children: comments!.posts
                                .map((e) => CardComment(
                                      comment: e,
                                    ))
                                .toList(),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ),
                ],
              ),
              TextComment(search: _search, textFocusNode: _textFocusNode)
            ]),
      ),
    ));
  }
}
