// ignore_for_file: must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uidesignfooddelivery/screen/login_screen.dart';
import 'package:uidesignfooddelivery/screen/splashscreen.dart';
import 'constants/appconstdata.dart';

int? intscreen; // SP
Future<void> main() async { //SP & FB
  WidgetsFlutterBinding.ensureInitialized();// SP & FB
  SharedPreferences vishnupref = await SharedPreferences.getInstance();//SP 1
  intscreen = (await vishnupref.getInt('initscreen'));// SP2
  await vishnupref.setInt('initscreen', 1);//SP 3
  await Firebase.initializeApp();//
  runApp(const InitialScreen());
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  AppConstants con = AppConstants();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: intscreen == 0 || intscreen == null
          ? const LoginScreen()
          : const SplashScreen(),
      title: con.appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
