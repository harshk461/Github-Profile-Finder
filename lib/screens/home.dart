import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_profile_finder/screens/profile_find.dart';
import 'package:github_profile_finder/utils/followers.dart';
import 'package:github_profile_finder/utils/profile_card.dart';
import 'package:github_profile_finder/utils/repo_card.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Home extends StatefulWidget {
  final Map<dynamic, dynamic> map;
  Home({super.key, required this.map});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> repo_data = [];
  List<dynamic> Follower_data = [];
  Map<dynamic, dynamic> Following_data = {};
  bool isRepo = false;
  bool isFollower = false;
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> data = widget.map;
    String followersUrl = data["followers_url"];
    String followingUrl =
        "https://api.github.com/users/$data['login']/following";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileCard(map: widget.map),
                const SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          String repoUrl = widget.map["repos_url"];
                          Response response =
                              await http.get(Uri.parse(repoUrl));
                          List<dynamic> repo = jsonDecode(response.body);
                          print(repo[0]);
                          setState(() {
                            repo_data = repo;
                            isRepo = true;
                            isFollower = false;
                            isFollowing = false;
                          });
                        },
                        child: const Text(
                          "Repository",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          Response response =
                              await http.get(Uri.parse(followersUrl));
                          List<dynamic> followerData =
                              jsonDecode(response.body);

                          setState(() {
                            Follower_data = followerData;
                            isFollower = true;
                            isRepo = false;
                            isFollowing = false;
                          });
                          print(Follower_data);
                        },
                        child: const Text(
                          "Followers",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () async {
                          Response response =
                              await http.get(Uri.parse(followingUrl));
                          Map<dynamic, dynamic> followingData =
                              jsonDecode(response.body);

                          setState(() {
                            Following_data = followingData;
                            isFollower = false;
                            isRepo = false;
                            isFollowing = true;
                          });
                        },
                        child: const Text(
                          "Followings",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                (isRepo == true)
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemCount: repo_data.length,
                          itemBuilder: (context, index) =>
                              RepoCard(map: repo_data[index]),
                        ),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                isFollower
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemCount: Follower_data.length,
                          itemBuilder: (context, index) => FollowerCard(
                            foll_data: Follower_data[index],
                          ),
                        ),
                      )
                    : Container(),
                isFollowing
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemCount: Following_data.length,
                          itemBuilder: (context, index) => FollowerCard(
                            foll_data: Following_data[index],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileFindPage()));
        },
        child: FaIcon(FontAwesomeIcons.magnifyingGlass),
        backgroundColor: Colors.green,
      ),
    );
  }
}
