import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants.dart';
class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

   const ProfileListItem({
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit*5.5,
      margin: const EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 4,
      ).copyWith(
        bottom: kSpacingUnit * 2,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
        color: Colors.purpleAccent,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: kSpacingUnit * 2.5,
          ),
          const SizedBox(width: kSpacingUnit * 1.5),
          Text(
            text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (hasNavigation)
            const Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit * 2.5,
            ),
        ],
      ),
    );
  }
}
