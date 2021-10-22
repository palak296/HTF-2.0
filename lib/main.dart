
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:garage_in_a_click/homepage.dart';
import 'package:garage_in_a_click/navigation.dart';
import 'package:garage_in_a_click/screens/home_screen.dart';

import 'package:garage_in_a_click/signup.dart';
import 'package:garage_in_a_click/start.dart';
import 'login.dart';
import 'onbording.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          primaryColor: Colors.purple
      ),
      debugShowCheckedModeBanner: false,
      home:
      AnimatedSplashScreen(
        splashIconSize: 300,
        splash: Image.asset('images/splash.jpg',),
        duration: 200,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.rotationTransition,

        nextScreen:  const MyNavBar(),

        //duration: 5 ,

      ),


      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>const Login(),
        "SignUp":(BuildContext context)=>const SignUp(),
        "start":(BuildContext context)=>  const Start(),
        "navbar": (BuildContext context)=> const MyNavBar(),
      },


    );
  }

}