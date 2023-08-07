import 'package:shared_preferences/shared_preferences.dart';

class Helperlogindetails{
  static String  userlogin ='userlogin';
  static saveuserlogindetails({required bool islogin})async {
    SharedPreferences vishnupref = await SharedPreferences.getInstance();
    vishnupref.setBool(userlogin, islogin );

  }
  static Future <bool?> getuserlogin()async{
    SharedPreferences vishnupref= await SharedPreferences.getInstance();
    return vishnupref.getBool(userlogin);
  } 
}