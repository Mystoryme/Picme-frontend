import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/gridposts.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:picme/widget/postcard/postcard.dart';
import 'package:picme/widget/postcard/postcard_grid.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';
import 'package:picme/widget/account_profile/sortby_account.dart';

class AccountProfileBar extends StatefulWidget {
  const AccountProfileBar({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  _AccountProfileBarState createState() => _AccountProfileBarState();
}

class _AccountProfileBarState extends State<AccountProfileBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Posts? posts;
  GridPosts? gridPosts;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    // init();
    load();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  load() {
    String uri = "/profile/post_search";
    String uri1 = "/profile/grid_search";
    if (sortby != "") {
      uri += "?sortBy=" + sortby;
      uri1 += "?sortBy=" + sortby;
    }
    Caller.dio.post(uri, data: {"userId": widget.userId}).then((response) {
      setState(() {
        posts = Posts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
    Caller.dio.post(uri1, data: {"userId": widget.userId}).then((response) {
      setState(() {
        gridPosts = GridPosts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }
  // void _handleTabSelection() {
  //   setState(() {});
  // }

  // init() {
  //   Caller.dio.get("/profile/post").then((response) {
  //     setState(() {
  //       posts = Posts.fromJson(response.data["data"]);
  //     });
  //   }).onError((DioException error, _) {
  //     Caller.handle(context, error);
  //   });
  //   Caller.dio.get("/profile/gridpost").then((response) {
  //     setState(() {
  //       gridPosts = GridPosts.fromJson(response.data["data"]);
  //     });
  //   }).onError((DioException error, _) {
  //     Caller.handle(context, error);
  //   });
  // }

  String sortby = "";
  void setSortby(String c) {
    setState(() {
      sortby = c;
    });
    load();
  }

  reload() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    if (posts == null || gridPosts == null) {
      return Container(
        padding: EdgeInsets.only(top: 10),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: PicmeColors.mainColor,
          // indicatorPadding: EdgeInsets.only(bottom: -10),
          controller: _tabController,
          tabs: [
            Icon(
              _tabController.index == 0
                  ? CupertinoIcons.square_fill
                  : CupertinoIcons.square,
              color: PicmeColors.mainColor,
              size: 33,
            ),
            Icon(
              _tabController.index == 1
                  ? CupertinoIcons.square_grid_2x2_fill
                  : CupertinoIcons.square_grid_2x2,
              color: PicmeColors.mainColor,
              size: 33,
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: PicmeColors.mainColor,
            indicatorPadding: EdgeInsets.only(bottom: -10),
            controller: _tabController,
            tabs: [
              Icon(
                _tabController.index == 0
                    ? CupertinoIcons.square_fill
                    : CupertinoIcons.square,
                color: PicmeColors.mainColor,
                size: 33,
              ),
              Icon(
                _tabController.index == 1
                    ? CupertinoIcons.square_grid_2x2_fill
                    : CupertinoIcons.square_grid_2x2,
                color: PicmeColors.mainColor,
                size: 33,
              ),
              // Icon(
              //   _tabController.index == 2
              //       ? CupertinoIcons.bookmark_fill
              //       : CupertinoIcons.bookmark,
              //   color: PicmeColors.mainColor,
              //   size: 33,
              // )
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: TabBarView(
            controller: _tabController,
            children: [
              Column(
                children: [
                  // SortBy(),
                  // SortBy(),
                  SortByAccount(setSortbyAccount: setSortby),
                  Column(
                    children: posts!.posts
                        .map((e) => PostCard(
                              post: e,
                              reload: reload,
                            ))
                        .toList(),
                  )
                ],
              ),
              Column(
                children: [
                  SortByAccount(
                    setSortbyAccount: setSortby,
                  ),
                  PostCardGrid(posts: gridPosts!)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
