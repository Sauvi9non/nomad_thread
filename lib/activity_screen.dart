import 'package:flutter/material.dart';

final List<String> activities = [
  "All",
  "Replies",
  "Mentions",
  "Verified",
  "Likes",
  "Follows",
];

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Activity",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.symmetric(vertical: 16),
            isScrollable: true,
            tabs: [
              for (var activity in activities)
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black45, width: 0.75),
                    ),
                    width: 110,
                    child: Center(
                      child: Text(
                        activity,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [ListTile()],
        ),
      ),
    );
  }
}
