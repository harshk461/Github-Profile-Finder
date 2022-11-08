import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final Map<dynamic, dynamic> map;
  const ProfileCard({super.key, required this.map});
  @override
  Widget build(BuildContext context) {
    String name = map["login"];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220.0,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade700,
            offset: const Offset(4, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Created on",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ),
                  Text(
                    map["created_at"],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_city,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(map["location"].toString().isEmpty
                          ? map["location"]
                          : "none"),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.people,
                            size: 30.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            map["followers"].toString() + " Followers",
                            style: const TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.people,
                            size: 30.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            map["following"].toString() + " Following",
                            style: const TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image(
              image: NetworkImage(
                map["avatar_url"],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
