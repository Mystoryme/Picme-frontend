import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/posts.dart';
import 'package:picme/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:picme/widget/postcard/postcard_grid.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';
import 'package:picme/widget/profile/sortby.dart';

class AccountProfileBar extends StatefulWidget {
  const AccountProfileBar({Key? key}) : super(key: key);

  @override
  _AccountProfileBarState createState() => _AccountProfileBarState();
}

class _AccountProfileBarState extends State<AccountProfileBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Posts posts = Posts(posts: []);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    // load();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  // load() {
  //   Caller.dio.get("/post/list").then((response) {
  //     setState(() {
  //       posts = response.data["data"]["posts"]
  //           .map<Post>((e) => Post.fromJson(e))
  //           .toList();
  //     });
  //   }).onError((DioException error, _) {
  //     Caller.handle(context, error);
  //   });
  // }

  // String sortby = "like";

  @override
  Widget build(BuildContext context) {
    // if (posts == null) {
    //   return Container(
    //     padding: EdgeInsets.only(top: 10),
    //     child: TabBar(
    //       indicatorSize: TabBarIndicatorSize.label,
    //       indicatorColor: PicmeColors.mainColor,
    //       indicatorPadding: EdgeInsets.only(bottom: -10),
    //       controller: _tabController,
    //       tabs: [
    //         Icon(
    //           _tabController.index == 0
    //               ? CupertinoIcons.square_fill
    //               : CupertinoIcons.square,
    //           color: PicmeColors.mainColor,
    //           size: 33,
    //         ),
    //         Icon(
    //           _tabController.index == 1
    //               ? CupertinoIcons.square_grid_2x2_fill
    //               : CupertinoIcons.square_grid_2x2,
    //           color: PicmeColors.mainColor,
    //           size: 33,
    //         ),
    //         Icon(
    //           _tabController.index == 2
    //               ? CupertinoIcons.bookmark_fill
    //               : CupertinoIcons.bookmark,
    //           color: PicmeColors.mainColor,
    //           size: 33,
    //         )
    //       ],
    //     ),
    //   );
    // }

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
                  PostCardGrid(),
                ],
              ),
              Column(
                children: [SortBy(), PostCardGrid()],
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
