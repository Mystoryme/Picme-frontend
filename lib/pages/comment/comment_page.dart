import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/comments.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/widget/comment/card_comment.dart';
import 'package:picme/widget/comment/head_comment.dart';
import 'package:picme/widget/comment/text_comment.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key, required this.postId, required this.onDelete})
      : super(key: key);

  static const routeName = "/comment_page";
  final int postId;
  final VoidCallback onDelete;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _search = TextEditingController();
  FocusNode _textFocusNode = FocusNode();
  CommentPosts? comments;
  Profile? profile;

  void callComment() async {
    Caller.dio.post("/comment/create", data: {
      "postId": widget.postId,
      "message": _search.text,
    }).then((response) async {
      init();

      //  Navigator.push(
      //   context,
      //    MaterialPageRoute(builder: (context) => const CommentPage()),
      //  );
    }).onError((DioException error, _) {
      // * Apply default error handling
      Caller.handle(context, error);
    });
  }

  @override
  void initState() {
    print('CommentPage is initialized.');
    super.initState();
    init();
  }

  init() {
    print('CommentPage is initialized.');
    Caller.dio.post("/comment/list", data: {"postId": widget.postId}).then(
        (response) {
      setState(() {
        comments = CommentPosts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
    Caller.dio.get("/profile/info").then((response) {
      setState(() {
        profile = Profile.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  void reloadPost() {
    init();
  }

  @override
  Widget build(BuildContext context) {
    // if (comments == null) {
    //   return Scaffold(body: CircularProgressIndicator());
    // }
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadComment(),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: comments?.posts
                          ?.map((el) => CardComment(
                                comment: el,
                                onDelete: reloadPost,
                                reload: widget.onDelete,
                              ))
                          ?.toList() ??
                      [],
                ),
              )
              // Column(
              //   children: [
              //     SingleChildScrollView(
              //       child: Container(
              //         child: Column(
              //           children: [
              //             Column(
              //               children: comments!.posts
              //                   .map((e) => CardComment(
              //                         comment: e,
              //                       ))
              //                   .toList(),
              //             )
              //           ],
              //           mainAxisAlignment: MainAxisAlignment.start,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              ,
              profile != null
                  ? TextComment(
                      search: _search,
                      textFocusNode: _textFocusNode,
                      profile: profile!,
                      callComment: callComment,
                    )
                  : SizedBox()
            ]),
      ),
    ));
  }
}
