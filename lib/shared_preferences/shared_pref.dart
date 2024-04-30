import 'package:shared_preferences/shared_preferences.dart';

class CachNetwork {
  static late SharedPreferences sharedpref;

  void cachIntialization() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  Future<bool> insertToCach(
      {required String key, required String value}) async {
    return await sharedpref.setString(key, value);
  }

  void getData({required String key}) {
    sharedpref.getString(key);
  }

  void delete({required String key}) {
    sharedpref.remove(key);
  }
}
