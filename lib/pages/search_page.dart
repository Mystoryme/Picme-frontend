import 'package:flutter/material.dart';
import 'package:picme/widget/search/button_search.dart';
import 'package:picme/widget/search/person_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = "/search_page";

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ButtonSearch(search: _search),
              const PersonSearch(),
            ],
          ),
        ),
      ),
    );
  }
}
