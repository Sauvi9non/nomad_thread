//데이터 읽고 쓰기
//를 위해 shared preference 패키지 설치
import 'package:shared_preferences/shared_preferences.dart';

class DisplayModeRepository {
  static const String _displayMode = "displayMode";

  final SharedPreferences _preferences;
  DisplayModeRepository(this._preferences);

  //화면 모드 관련 데이터 저장
  Future<void> setDisplayMode(bool value) async {
    _preferences.setBool(_displayMode, value);
  }

  //읽기
  bool isDisplayMode() {
    return _preferences.getBool(_displayMode) ??
        true; //true는 light false는 dark 디스크에 없느면 true, light로 간주
  }
}
