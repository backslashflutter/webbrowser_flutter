import 'package:shared_preferences/shared_preferences.dart';

void savePassLocal(name,password) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // int counter = (prefs.getInt('counter') ?? 0) + 1;
  // print('Pressed $counter times.');
  // await prefs.setInt('counter', counter);

  prefs.setString(name,password);
}

Future<String> getPassLocal(name) async {

SharedPreferences prefs = await SharedPreferences.getInstance();
return prefs.getString(name);
}

void deletePassLocal(name) async {

SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.remove(name);

}