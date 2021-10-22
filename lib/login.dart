import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:garage_in_a_click/navigation.dart';
import 'package:garage_in_a_click/start.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Start()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            const Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
  //...........
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.toString());
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              const SizedBox(height: 20),

              Positioned(top: 40, left: 0, child: _backButton()),

              const SizedBox(
                height: 400,
                child: Image(
                  image: AssetImage("images/login.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) return 'Enter Email';
                        },

                        decoration: const InputDecoration(

                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email)),
                        onSaved: (input) => _email = input!),
                    TextFormField(
                        validator: (input) {
                          if (input!.length < 6) {
                            return 'Provide Minimum 6 Character';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        onSaved: (input) => _password = input!),
                    const SizedBox(height: 30),

                    RaisedButton(
                      padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: login,
                      child: const Text('LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    )

                  ],

                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Don\'t have an account ?',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),

                    ],
                  ),
                ),
                onTap: navigateToSignUp,
              )
            ],

          ),

        ));
  }
}