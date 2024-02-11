import 'package:flutter/material.dart';
import 'package:noli/components/UserInfo.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UserInfoBox(title: 'Total Moments'), UserInfoBox(title: 'Streak')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UserInfoBox(title: 'Popular Category'), UserInfoBox(title: 'Total Aspirations')],
        )
      ],
    );
  }
}
