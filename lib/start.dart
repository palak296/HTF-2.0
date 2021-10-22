import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
        await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else {
      throw StateError('Sign in Aborted');
    }
  }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 35.0),
          const SizedBox(
            height: 400,
            child: Image(
              image: AssetImage("images/start.jpg"),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
              text: const TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Ready To Go',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,

                            color: Colors.purple))
                  ])),

          const SizedBox(height: 10.0),
          const Text(
            'CAR SERVICES MADE SMART',

            style: TextStyle(color: Colors.black),
          ),


          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToLogin,
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.purple),
              const SizedBox(width: 20.0),
              RaisedButton(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  onPressed: navigateToRegister,
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.purple),

            ],
          ),
          const SizedBox(height: 20.0),
          SignInButton(Buttons.Google,

              text: "Sign up with Google",
              onPressed: googleSignIn)
        ],
      ),
    );
  }
}