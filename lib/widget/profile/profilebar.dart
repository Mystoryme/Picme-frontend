import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/bookposts.dart';
import 'package:picme/models/gridpost.dart';
import 'package:picme/models/gridposts.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/widget/postcard/postcard_bookmark.dart';
import 'package:picme/widget/postcard/postcard_grid.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';
import 'package:picme/widget/profile/sortby.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({Key? key, required this.reloadProfile}) : super(key: key);
  final VoidCallback reloadProfile;

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // List<bool> tabSelected = [true, true, true];
  Posts? posts;
  GridPosts? gridPosts;
  BookPosts? bookPosts;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

    load();
  }

  load() {
    String uri = "/profile/post";
    String uri1 = "/profile/gridpost";
    String uri2 = "/profile/bookmarkpost";
    if (sortby != "") {
      uri += "?sortBy=" + sortby;
      uri1 += "?sortBy=" + sortby;
      uri2 += "?sortBy=" + sortby;
    }
    Caller.dio.get(uri).then((response) {
      setState(() {
        posts = Posts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
    Caller.dio.get(uri1).then((response) {
      setState(() {
        gridPosts = GridPosts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
    Caller.dio.get(uri2).then((response) {
      setState(() {
        bookPosts = BookPosts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  String sortby = "";
  void setSortby(String c) {
    setState(() {
      sortby = c;
    });
    load();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (posts == null || gridPosts == null || bookPosts == null) {
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
                  SortBy(setSortby: setSortby),
                  Column(
                    children: posts!.posts
                        .map((e) => PostCardOwner(
                              post: e,
                              onDelete: widget.reloadProfile,
                            ))
                        .toList(),
                  )
                ],
              ),
              Column(
                children: [
                  SortBy(setSortby: setSortby),
                  PostCardGrid(posts: gridPosts!)
                ],
              ),
              Column(
                children: [
                  SortBy(setSortby: setSortby),
                  PostCardBook(posts: bookPosts!)
                ],
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
