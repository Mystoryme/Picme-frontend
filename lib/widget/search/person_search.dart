import 'dart:async';

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/histories.dart';
import 'package:picme/models/search.dart';
import 'package:picme/models/searches.dart';
import 'package:picme/pages/account_profile_page.dart';
import 'package:picme/pages/home_page.dart';
import 'package:picme/utils/colors.dart';

class PersonSearch extends StatefulWidget {
  PersonSearch(
      {Key? key,
      required this.searches,
      required this.search,
      required this.textFocusNode,
      required this.reload,
      required this.histories})
      : super(key: key);
  final Searches searches;
  final TextEditingController search;
  final FocusNode textFocusNode;
  final void Function() reload;
  final Histories? histories;

  @override
  _PersonSearchState createState() => _PersonSearchState();
}

class _PersonSearchState extends State<PersonSearch> {
  // List<String> get usernames => [widget.search.username];

  Timer? debounce;

  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  void onTriggerSearch(String actualSearch) {
    if (actualSearch.isEmpty) {
      setState(() {
        searches = null;
      });

      return;
    }
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      // do something with searchController.text
      load(actualSearch: actualSearch);
      // submit();
    });
  }

  Searches? searches;

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  load({String actualSearch = ""}) {
    if (widget.search.text.isEmpty) {
      return; // No need to make an API call if the search text is empty
    }

    Caller.dio.post("/insight/search", data: {
      "username": widget.search.text,
    }).then((response) {
      setState(() {
        searches = Searches.fromJson(response.data["data"]);
        print('2');
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: TextFormField(
                    focusNode: widget.textFocusNode,
                    onTap: () => widget.reload(),
                    onChanged: ((value) {
                      onTriggerSearch(value);
                    }),
                    controller: widget.search,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: PicmeColors.mainColor,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA0A5D8),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      fillColor: const Color.fromRGBO(243, 242, 242, 1),
                      filled: true,
                      suffixIcon: widget.textFocusNode.hasFocus
                          ? IconButton(
                              onPressed: (() => _clearTextField(widget.search)),
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black54,
                              ),
                            )
                          : null,
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF141D3B),
                    ),
                    cursorColor: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            key: UniqueKey(),
            color: const Color(0xFFF3F2F2),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: searches != null
                    ? [
                        Column(
                          children: searches!.users
                              .map((e) => buildListTile(e))
                              .toList(),
                        )
                      ]
                    : [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent',
                                style: TextStyle(
                                  color: PicmeColors.mainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     setState(() {
                              //       widget.searches.users.clear();
                              //     });
                              //   },
                              //   child: Text(
                              //     'Delete all',
                              //     style: TextStyle(
                              //       color: PicmeColors.mainColor,
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.normal,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        if (widget.histories != null &&
                            widget.histories!.history.isNotEmpty)
                          Column(
                            children: widget.histories!.history
                                .map((e) => buildListTile2(
                                    context,
                                    e.triggee?.avatarUrl ??
                                        'https://cdn.crispedge.com/5d76cb.png',
                                    e.triggeeId!,
                                    e.triggee!.username ?? ""))
                                .toList(),
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              'There are no previously searched items.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                      ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListTile(Search? info) {
    print("Info: $info");
    return info != null
        ? ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: Image.network(info.avatarUrl ??
                        'https://cdn.crispedge.com/5d76cb.png')
                    .image),
            title: GestureDetector(
              onTap: () {
                // Navigate to the account_profile.dart screen when the text is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountProfilePage(
                            userId: info.id,
                          )),
                );
              },
              child: Text(
                info.username,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            // trailing: IconButton(
            //   disabledColor: Colors.transparent,
            //   icon: const Icon(
            //     Icons.clear,
            //     color: Color(0xFFA0A5D8),
            //   ),
            //   onPressed: () {
            //     print("onDelete is called");
            //     onDelete();
            //   },
            // ),
          )
        : Text("aaaaa");
  }
}

Widget buildListTile2(context, String avatarUrl, int id, String username) {
  return ListTile(
    leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: Image.network(avatarUrl).image),
    title: GestureDetector(
      onTap: () {
        // Navigate to the account_profile.dart screen when the text is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccountProfilePage(
                    userId: id,
                  )),
        );
      },
      child: Text(
        username,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    // trailing: IconButton(
    //   disabledColor: Colors.transparent,
    //   icon: const Icon(
    //     Icons.clear,
    //     color: Color(0xFFA0A5D8),
    //   ),
    //   onPressed: () {
    //     print("onDelete is called");
    //     onDelete();
    //   },
    // ),
  );
}
