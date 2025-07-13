import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _loginStateKey = 'login_state';
  static const String _userProviderKey = 'user_provider';

  // 카카오 로그인
  Future<bool> signInWithKakao() async {
    try {
      // TODO: 실제 카카오 SDK 연동
      await Future.delayed(const Duration(seconds: 2)); // 시뮬레이션

      // 로그인 상태 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_loginStateKey, true);
      await prefs.setString(_userProviderKey, 'kakao');

      return true;
    } catch (e) {
      print('Kakao login error: $e');
      return false;
    }
  }

  // 네이버 로그인
  Future<bool> signInWithNaver() async {
    try {
      // TODO: 실제 네이버 SDK 연동
      await Future.delayed(const Duration(seconds: 2)); // 시뮬레이션

      // 로그인 상태 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_loginStateKey, true);
      await prefs.setString(_userProviderKey, 'naver');

      return true;
    } catch (e) {
      print('Naver login error: $e');
      return false;
    }
  }

  // 구글 로그인
  Future<bool> signInWithGoogle() async {
    try {
      // TODO: 실제 구글 SDK 연동
      await Future.delayed(const Duration(seconds: 2)); // 시뮬레이션

      // 로그인 상태 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_loginStateKey, true);
      await prefs.setString(_userProviderKey, 'google');

      return true;
    } catch (e) {
      print('Google login error: $e');
      return false;
    }
  }

  // 애플 로그인
  Future<bool> signInWithApple() async {
    try {
      // TODO: 실제 애플 SDK 연동
      await Future.delayed(const Duration(seconds: 2)); // 시뮬레이션

      // 로그인 상태 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_loginStateKey, true);
      await prefs.setString(_userProviderKey, 'apple');

      return true;
    } catch (e) {
      print('Apple login error: $e');
      return false;
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loginStateKey);
    await prefs.remove(_userProviderKey);
  }

  // 로그인 상태 확인
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginStateKey) ?? false;
  }

  // 로그인 제공자 확인
  Future<String?> getLoginProvider() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userProviderKey);
  }
}
