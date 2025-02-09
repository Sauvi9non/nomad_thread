import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad_thread/icon_nav.dart';
import 'package:nomad_thread/timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SvgPicture threadLogo = SvgPicture.network(
    "https://logotyp.us/file/threads.svg",
    width: 100,
  );
  int _selectedIndex = 0; //home이 디폴트

  void _onIconTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Container(child: Timeline()),
      Container(
        child: Text("돋보기"),
      ),
      Container(
        child: Text("글쓰기"),
      ),
      Container(
        child: Text("하트"),
      ),
      Container(
        child: Text("프로필"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: threadLogo,
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconNav(
              onTap: () => _onIconTap(0), //아이콘이 눌림, 그러면 선택된 인덱스값이 0이된다.
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0, //인덱스 값이 0이 맞으면 true, 아니면 false,
              selectedColor: Colors.black,
            ),
            IconNav(
              onTap: () => _onIconTap(1), //아이콘이 눌림, 그러면 선택된 인덱스값이 0이된다.
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1, //인덱스 값이 0이 맞으면 true, 아니면 false,
              selectedColor: Colors.black,
            ),
            IconNav(
              onTap: () => _onIconTap(2), //아이콘이 눌림, 그러면 선택된 인덱스값이 0이된다.
              icon: FontAwesomeIcons.pen,
              isSelected: _selectedIndex == 2, //인덱스 값이 0이 맞으면 true, 아니면 false,
              selectedColor: Colors.black,
            ),
            IconNav(
              onTap: () => _onIconTap(3), //아이콘이 눌림, 그러면 선택된 인덱스값이 0이된다.
              icon: FontAwesomeIcons.heart,
              isSelected: _selectedIndex == 3, //인덱스 값이 0이 맞으면 true, 아니면 false,
              selectedColor: Colors.black,
            ),
            IconNav(
              onTap: () => _onIconTap(4), //아이콘이 눌림, 그러면 선택된 인덱스값이 0이된다.
              icon: FontAwesomeIcons.user,
              isSelected: _selectedIndex == 4, //인덱스 값이 0이 맞으면 true, 아니면 false,
              selectedColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
