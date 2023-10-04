import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                children: [SortBy(), PostCardOwner()],
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
