import 'package:flutter/material.dart';
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

  void reloadState() {
    setState(() {});
  }

  // final int _currentIndex = 0;
  // final ValueChanged<int> _onTap = (value) => print(value);
  @override
  Widget build(BuildContext context) {
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
              child: const PersonSearch(),
            ),
            SizedBox(height: 10),
            GridPhoto(),
            // Home_bar(currentIndex: _currentIndex, onTap: _onTap)
          ],
        ),
      ),
    );
  }
}
