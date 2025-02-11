import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(), //아이콘
            SliverToBoxAdapter(
              child: Column(),
            ),
            // SliverPersistentHeader( //탭바
            //   delegate: SliverPersistentHeaderDelegate(),
            // ),
          ];
        },
        body: TabBarView(
          //페이지
          children: [
            Text("Threads"),
            Text("Replies"),
          ],
        ),
      ),
    );
  }
}
