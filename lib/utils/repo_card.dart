import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepoCard extends StatelessWidget {
  final Map<dynamic, dynamic> map;
  const RepoCard({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            map['name'],
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            map["description"].toString().isEmpty
                ? map["description"]
                : "No Description Found",
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.star,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    map["stargazers_count"].toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(
                width: 15.0,
              ),
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.codeFork,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    map["forks_count"].toString(),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(
                width: 15.0,
              ),
              Row(
                children: [
                  Text(
                    map["language"].toString(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
