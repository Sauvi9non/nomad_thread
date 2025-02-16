import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_thread/constants/gaps.dart';
import 'package:nomad_thread/constants/sizes.dart';
import 'package:nomad_thread/isDarkMode.dart';
import 'package:nomad_thread/settings_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
      ),
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  leading: IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.networkWired)),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.instagram)),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                        },
                        icon: FaIcon(FontAwesomeIcons.chartLine)),
                  ],
                ), //아이콘
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jane",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: Sizes.size44,
                                ),
                              ),
                              Row(
                                children: [
                                  Text("jane_mobbin"),
                                  Gaps.h6,
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: isDarkMode(context)
                                          ? Colors.grey.shade600
                                          : Colors.grey[100],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.size14,
                                          vertical: Sizes.size8),
                                      child: Text(
                                        "threads.net",
                                        style: TextStyle(
                                          color: isDarkMode(context)
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Gaps.v10,
                              Text(
                                "Plant enthusiast!",
                                style: TextStyle(
                                  fontSize: Sizes.size18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Gaps.v10,
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        widthFactor: 2,
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.lightBlue,
                                          foregroundColor: Colors.amber,
                                          foregroundImage: NetworkImage(
                                              "https://soopool.art/img/infoac/NPC/Tom_Nook/Tom_Nook.png"),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.amber,
                                        foregroundImage: NetworkImage(
                                            "https://soopool.art/img/infoac/NPC/Redd/Redd.png"),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "2 followers",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: Sizes.size18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.amber,
                            foregroundImage: NetworkImage(
                                "https://soopool.art/image/acnh/animal/Rosie.png"),
                          )
                        ],
                      ), //프로필
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                              horizontal: Sizes.size44,
                            ),
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size10,
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                )),
                            child: Text(
                              "Edit profile",
                              style: TextStyle(
                                //color: Colors.black,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                              horizontal: Sizes.size44,
                            ),
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size10,
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                )),
                            child: Text(
                              "Share profile",
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ), //버튼 두개
                      Gaps.v10,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  //탭바
                  delegate: ProfileTabBar(),
                ),
              ];
            },
            body: TabBarView(
              //페이지
              children: [
                Center(
                    child: Text(
                  "Threads",
                  style: TextStyle(
                      fontSize: Sizes.size28, fontWeight: FontWeight.bold),
                )),
                Center(
                    child: Text(
                  "Replies",
                  style: TextStyle(
                      fontSize: Sizes.size28, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.symmetric(
        vertical: Sizes.size10,
      ),
      tabs: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Text(
            "Threads",
            style: TextStyle(
              // color: Colors.black,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Text(
            "Replies",
            style: TextStyle(
              // color: Colors.black,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
