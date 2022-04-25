import 'package:get_storage/get_storage.dart';

mixin AuthCacheManager {
  var authBox = GetStorage();

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

  Future<void> removeUserCacheInfo() async {
    await authBox.remove(LoginCacheManagerKey.TOKEN.toString());
    await authBox.remove(LoginCacheManagerKey.EMAIL.toString());
    await authBox.remove(LoginCacheManagerKey.USERID.toString());
    await authBox.remove(LoginCacheManagerKey.ROLE.toString());
  }

  String? getToken() => authBox.read(LoginCacheManagerKey.TOKEN.toString());
  String? getEmail() => authBox.read(LoginCacheManagerKey.EMAIL.toString());
  String? getUserId() => authBox.read(LoginCacheManagerKey.USERID.toString());
  String? getRole() => authBox.read(LoginCacheManagerKey.ROLE.toString());
}

enum LoginCacheManagerKey { TOKEN, EMAIL, USERID, ROLE }
