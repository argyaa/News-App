import 'package:shared_preferences/shared_preferences.dart';

class DataFavorite {
  List<String> FavTitle = [];
  List<String> FavTime = [];
  List<String> FavImage = [];
  List<String> FavSource = [];

  void saveData(bool isOn) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("bookmark", isOn);
  }

  // ignore: missing_return
  Future<bool> getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getBool("bookmark") ?? false;
  }
}
