import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/boost.dart';
import 'package:picme/models/boosts.dart';
import 'package:picme/models/search.dart';
import 'package:picme/widget/home/buttonbar.dart';
import 'package:picme/widget/search/button_search.dart';
import 'package:picme/widget/search/grid_photo.dart';
import 'package:picme/widget/search/person_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = "/search_page";
  

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _search = TextEditingController();
  FocusNode _textFocusNode = FocusNode();
  Boosts? posts;

@override
  void reloadState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    load();
  }

load(){
    String uri = "/post/listboost";

  Caller.dio.get(uri).then((response) {
      setState(() {
        posts = Boosts.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
}

  // final int _currentIndex = 0;
  // final ValueChanged<int> _onTap = (value) => print(value);
  @override
  Widget build(BuildContext context) {
    if (posts == null) {
      return const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ButtonSearch(
              search: _search,
              textFocusNode: _textFocusNode,
              reload: reloadState,
            ),
            // Text(_textFocusNode.hasFocus.toString()),
            Visibility(
              visible: _textFocusNode.hasFocus,
              child:  PersonSearch(),
            ),
            const SizedBox(height: 10),
            GridPhoto( posts: posts!),
            // Home_bar(currentIndex: _currentIndex, onTap: _onTap)
          ],
        ),
      ),
    );
  }
}
