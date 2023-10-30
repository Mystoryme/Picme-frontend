import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
             child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      HeadComment(),
                      CardComment(),
                    ],
                  ),
                  TextComment(search: _search, textFocusNode: _textFocusNode)
            ]),
      ),
    ));
  }
}
