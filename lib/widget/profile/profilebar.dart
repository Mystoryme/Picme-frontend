import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/gridposts.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/postcard/postcard_grid.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';
import 'package:picme/widget/profile/sortby.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // List<bool> tabSelected = [true, true, true];
  Posts? posts;
  GridPosts? gridPosts;

  String sortby = "like";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    init();
  }

  init() {
    Caller.dio.get("/profile/post").then((response) {
      setState(() {
        posts = Posts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
    Caller.dio.get("/profile/gridpost").then((response) {
      setState(() {
        gridPosts = GridPosts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (posts == null) {
      return Container(
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
            Icon(
              _tabController.index == 2
                  ? CupertinoIcons.bookmark_fill
                  : CupertinoIcons.bookmark,
              color: PicmeColors.mainColor,
              size: 33,
            )
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
              Icon(
                _tabController.index == 2
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                color: PicmeColors.mainColor,
                size: 33,
              )
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
                  SortBy(),
                  Column(
                    children: posts!.posts
                        .map((e) => PostCardOwner(
                              post: e,
                            ))
                        .toList(),
                  )
                ],
              ),
              Column(
                children: [
                  SortBy(),
                  Column(
                    children: gridPosts!.posts
                        .map((e) => PostCardGrid(
                              post: e,
                              postcount: gridPosts!.posts.length,
                            ))
                        .toList(),
                  )
                ],
              ),
              Column(
                children: [SortBy()],
              )
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
