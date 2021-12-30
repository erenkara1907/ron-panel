import 'package:get_storage/get_storage.dart';

enum CacheManagerKey { TOKEN }

class CacheManager {
  Future<bool> saveToken(String token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    var token = box.read(CacheManagerKey.TOKEN.toString());
    return token;
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }
}
