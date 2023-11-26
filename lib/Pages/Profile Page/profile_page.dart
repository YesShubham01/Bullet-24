import 'package:bullet24/Pages/Profile%20Page/user_profile.dart';
import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Services/FireAuth%20Service/phone_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPhoneNull = context.watch<MyProvider>().isUserPhoneNull();
    if (isPhoneNull) {
      return const PhoneAuthPage();
    } else {
      return const UserProfile();
    }
  }
}
