import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
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
  //.....
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name, _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        await _auth.currentUser!.updateProfile(displayName: _name);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

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
        if (input!.isEmpty) return 'Enter Name';
        },
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
            onSaved: (input) => _name = input!),
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
        const SizedBox(height: 20),
        RaisedButton(
        padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
        onPressed: signUp,
        child: const Text('SignUp',
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
    ],
    ),
    ));
  }
}