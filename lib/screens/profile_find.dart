import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_profile_finder/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProfileFindPage extends StatefulWidget {
  const ProfileFindPage({super.key});

  @override
  State<ProfileFindPage> createState() => _ProfileFindPageState();
}

class _ProfileFindPageState extends State<ProfileFindPage> {
  TextEditingController _value = TextEditingController();
  String image_url = 'https://avatars.githubusercontent.com/u/97463268?v=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _value,
                    decoration: InputDecoration(
                      hintText: "Enter",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String url = 'https://api.github.com/users/';
                      Response response =
                          await http.get(Uri.parse(url + _value.text.trim()));
                      Map<dynamic, dynamic> map = jsonDecode(response.body);

                      print(map["login"]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(
                                    map: map,
                                  )));
                    },
                    child: Text("Find"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
