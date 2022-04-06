import 'package:get_storage/get_storage.dart';

mixin AuthCacheManager {
  final authBox = GetStorage();

  Future<bool> saveLoginInfo(
      String token, String eMail, String userId, int role) async {
    try {
      await authBox.write(LoginCacheManagerKey.TOKEN.toString(), token);
      await authBox.write(LoginCacheManagerKey.EMAIL.toString(), eMail);
      await authBox.write(LoginCacheManagerKey.USERID.toString(), userId);
      await authBox.write(LoginCacheManagerKey.ROLE.toString(), role);
    } catch (e) {
      print('$e -------- Login cache isleminde problem olustu.');
      return false;
    }
    return true;
  }

  String? getToken() {
    return authBox.read(LoginCacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    await authBox.remove;
  }
}

enum LoginCacheManagerKey { TOKEN, EMAIL, USERID, ROLE }
