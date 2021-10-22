//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:garage_in_a_click/widgets/profile_list_item.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 10,
            width: kSpacingUnit * 10,
            margin: EdgeInsets.only(top: kSpacingUnit* 2),
            child: Stack(
              children: <Widget>[
                const CircleAvatar(
                  radius: kSpacingUnit * 5,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit * 2.5,
                    width: kSpacingUnit * 2.5,
                    decoration: const BoxDecoration(
                      color: Colors.purpleAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      heightFactor: kSpacingUnit * 1.5,
                      widthFactor: kSpacingUnit * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        //size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: kSpacingUnit * 2),
          const Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          const SizedBox(height: kSpacingUnit * 0.5),
          const Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),
          const SizedBox(height: kSpacingUnit * 2),
          Container(
            height: kSpacingUnit * 4,
            width: kSpacingUnit * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit * 3),
              color: Colors.purpleAccent,
            ),
            child: const Center(
              child: Text(
                'Upgrade to PRO',
                style: kButtonTextStyle,
              ),
            ),
          ),
          SizedBox(height: kSpacingUnit * 4),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: kSpacingUnit * 2),
        profileInfo,
        const SizedBox(width: kSpacingUnit * 3),
      ],
    );

    return Builder(
      builder: (context) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              const SizedBox(height: kSpacingUnit * 5),
              header,
              Expanded(
                child: ListView(
                  children: const [
                    ProfileListItem(
                      icon: LineAwesomeIcons.user_shield,
                      text: 'Privacy',
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.history,
                      text: 'Purchase History',
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.question_circle,
                      text: 'Help & Support',
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.cog,
                      text: 'Settings',
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.user_plus,
                      text: 'Invite a Friend',
                    ),
                    ProfileListItem(
                      icon: LineAwesomeIcons.alternate_sign_out,
                      text: 'Logout',
                      hasNavigation: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
