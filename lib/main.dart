import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomad_thread/display_mode_model.dart';
import 'package:nomad_thread/display_mode_repo.dart';
import 'package:nomad_thread/display_mode_vm.dart';
import 'package:nomad_thread/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = DisplayModeRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        displayModeProvider.overrideWith(() => DisplayModeViewModel(repository))
      ],
      child: NomadThreadApp(),
    ),
  );
}

class NomadThreadApp extends StatelessWidget {
  const NomadThreadApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //기본 전역 설정들 다 여기에
      title: "Thread Clone",
      themeMode: context.watch<DisplayModeModel>().displayMode
          ? ThemeMode.light
          : ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.light,
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
        tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
            color: Colors.black.withAlpha(200),
            borderRadius: BorderRadius.circular(10),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size18,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          indicator: BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: BorderRadius.circular(10),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
        ),
      ),
      home: HomeScreen(), //실행 시 가장 먼저 보이는 화면
    );
  }
}
