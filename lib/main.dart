import 'package:flutter/material.dart';
import 'package:nomad_thread/home_screen.dart';

import 'constants/sizes.dart';

void main() {
  runApp(const NomadThreadApp());
}

class NomadThreadApp extends StatelessWidget {
  const NomadThreadApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //기본 전역 설정들 다 여기에
      title: "Thread Clone",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size18,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size8,
            vertical: Sizes.size4,
          ),
          color: Colors.white,
          elevation: 0,
        ),
      ),
      home: HomeScreen(), //실행 시 가장 먼저 보이는 화면
    );
  }
}
