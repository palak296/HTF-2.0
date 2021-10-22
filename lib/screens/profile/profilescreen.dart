import 'package:flutter/material.dart';
import 'package:garage_in_a_click/screens/profile/components/body.dart';

import '../../navigation.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Body(),

    );
  }
}