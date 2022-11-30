import 'package:shared_preferences/shared_preferences.dart';

import '../components/sharedpref/shared_preference.dart';

//  Future getToken()async
// {
//   final prefs = await SharedPreferences.getInstance();
//   String? token =  prefs.getString("token");
//   return token ;
// }

var token = SharedCashHelper.getValue(key: "token");
var photo =SharedCashHelper.getValue(key: "imagePath");
