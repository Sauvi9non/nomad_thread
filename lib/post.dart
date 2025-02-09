import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_thread/constants/gaps.dart';
import 'package:nomad_thread/icon_nav.dart';

import 'constants/sizes.dart';

class Post extends StatefulWidget {
  final String nickname;
  final String post;
  final String profileImg;
  final bool isVerified;

  const Post(
      {super.key,
      required this.nickname,
      required this.post,
      required this.profileImg,
      required this.isVerified});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  int heart = 1;
  int reply = 2;
  int repost = 3;
  int share = 4;

  void _onIconButtonClicked(String type) {
    setState(() {
      switch (type) {
        case "heart":
          heart = heart * (-1);
          break;
        case "repost":
          repost = repost * (-1);
          break;
        case "reply":
          reply = reply * (-1);
          break;
        case "share":
          share = share * (-1);
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gaps.h10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center, //자식 위젯 가운데 정렬
                children: [
                  SizedBox(
                    //프로필 + +버튼
                    width: 60,
                    height: 60,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          //프로필 이미지
                          radius: 50,
                          backgroundImage: NetworkImage(
                            widget.profileImg,
                          ),
                        ),
                        Positioned(
                          top: 36,
                          left: 36,
                          child: CircleAvatar(
                            radius: 15,
                            //+ 아이콘
                            backgroundColor: Colors.white,
                            child: FaIcon(
                              FontAwesomeIcons.circlePlus,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), // 프로필 사진
                  Gaps.v10,
                  Expanded(
                    child: Container(
                      width: Sizes.size2,
                      color: Colors.grey,
                    ),
                  ),
                  Gaps.v10,
                  SizedBox(
                    //댓글 프로필
                    width: 60,
                    height: 60,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            widget.profileImg,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ), //왼쪽 프로필 사진, 댓글들 이미지
              Gaps.h20,
              Expanded(
                //우측 메인
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //닉네임, 시간, 더보기
                        Row(
                          children: [
                            Text(
                              widget.nickname,
                              style: TextStyle(
                                fontSize: Sizes.size18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Gaps.h5,
                            widget.isVerified
                                ? FaIcon(
                                    FontAwesomeIcons.check,
                                    color: Colors.blue,
                                  )
                                : Gaps.h1,
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              "2m",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Sizes.size18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gaps.h18,
                            FaIcon(
                              FontAwesomeIcons.ellipsis,
                              color: Colors.black,
                              size: Sizes.size18,
                            ),
                          ],
                        )
                      ],
                    ),
                    Gaps.v5,
                    Text(
                      widget.post,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.v5,
                    ClipRRect(
                      //이미지
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfWfpKDKa5xfED2U2TeLxplhBw2t0aktcQHg&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gaps.v10,
                    Row(
                      //버튼 모음
                      children: [
                        IconNav(
                          icon: FontAwesomeIcons.heart,
                          isSelected: heart < 0,
                          onTap: () => _onIconButtonClicked("heart"),
                          selectedColor: Colors.red,
                        ),
                        IconNav(
                          icon: FontAwesomeIcons.message,
                          isSelected: reply < 0,
                          onTap: () => _onIconButtonClicked("reply"),
                          selectedColor: Colors.lightBlue,
                        ),
                        IconNav(
                          icon: FontAwesomeIcons.retweet,
                          isSelected: repost < 0,
                          onTap: () => _onIconButtonClicked("repost"),
                          selectedColor: Colors.green,
                        ),
                        IconNav(
                          icon: FontAwesomeIcons.paperPlane,
                          isSelected: share < 0,
                          onTap: () => _onIconButtonClicked("share"),
                          selectedColor: Colors.lightBlue,
                        )
                      ],
                    ),
                    Gaps.v10,
                    Row(
                      children: [
                        Text(
                          "8 replies",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gaps.h5,
                        Text(
                          "·",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gaps.h5,
                        Text(
                          "1234 likes",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Gaps.h20,
            ],
          ),
        ),
      ),
    );
  }
}
