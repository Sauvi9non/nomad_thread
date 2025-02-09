import 'package:flutter/material.dart';
import 'package:nomad_thread/constants/gaps.dart';
import 'package:nomad_thread/post.dart';
import './data.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v16,
          for (var post in userPostdata)
            Post(
                nickname: post["nickname"],
                post: post["postContext"],
                profileImg: post["profileImg"],
                isVerified: post["isVerified"])
        ],
      ),
    );
  }
}
