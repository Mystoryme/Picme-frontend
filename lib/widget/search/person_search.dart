import 'package:flutter/material.dart';
import 'package:picme/utils/colors.dart';

class PersonSearch extends StatefulWidget {
  const PersonSearch({Key? key});

  @override
  _PersonSearchState createState() => _PersonSearchState();
}

class _PersonSearchState extends State<PersonSearch> {
  List<String> usernames = [
    'ra_rabitty',
    'ra_rabitty',
    'ra_rabitty',
    'ra_rabitty'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      child: Card(
        color: const Color(0xFFF3F2F2),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          usernames.clear();
                        });
                      },
                      child: Text(
                        'Delete all',
                        style: TextStyle(
                          color: PicmeColors.mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (usernames.isNotEmpty)
                Column(
                  children: [
                    for (var username in usernames)
                      buildListTile(username, () {
                        setState(() {
                          usernames.remove(username);
                        });
                      }),
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
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
      ),
    );
  }

  ListTile buildListTile(String username, VoidCallback onDelete) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/profile.jpg'),
      ),
      title: Text(
        username,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: IconButton(
        disabledColor: Colors.transparent,
        icon: Icon(
          Icons.clear,
          color: Color(0xFFA0A5D8),
        ),
        onPressed: onDelete,
      ),
    );
  }
}
