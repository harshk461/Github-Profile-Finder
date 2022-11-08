import 'package:flutter/material.dart';

class FollowerCard extends StatefulWidget {
  final Map<dynamic, dynamic> foll_data;
  final String Followers;
  const FollowerCard(
      {super.key, required this.foll_data, required this.Followers});

  @override
  State<FollowerCard> createState() => _FollowerCardState();
}

class _FollowerCardState extends State<FollowerCard> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.foll_data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.green,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 80.0,
              height: 80.0,
              child: Image(
                image: NetworkImage(widget.foll_data["avatar_url"]),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.foll_data["login"],
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Followers",
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Following",
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow),
              ),
            ],
          )
        ],
      ),
    );
  }
}
