import 'package:bullet24/Objects/user_detail.dart';
import 'package:bullet24/Services/FireAuth%20Service/authentication.dart';
import 'package:bullet24/Services/FireStore%20Services/firestore.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  bool isLoggined;
  UserDetail userDetail = UserDetail();

  MyProvider({
    this.isLoggined = false,
  });

  setUserDetails(UserDetail user) {
    userDetail = user;
  }

  isUserNameNull() {
    if (userDetail.name == null) {
      return true;
    }
    return false;
  }

  setUserName(String? val) {
    setUserUid();
    userDetail.name = val;
    notifyListeners();
  }

  isUserPhoneNull() {
    if (userDetail.phone == null) {
      return true;
    }
    return false;
  }

  setUserPhone(String? val) {
    userDetail.phone = val;
    notifyListeners();
  }

  void setLogined(bool val) {
    isLoggined = val;
    notifyListeners();
  }

  void setUserUid() {
    userDetail.uid = Authenticate.getUserUid();
  }

  void setNotification(BuildContext context) async {
    userDetail.notification = await FireStore.fetchNotifications(context);
  }

  List<String>? getNotifications() {
    return userDetail.notification;
  }

  String? getNotificationNumber() {
    return userDetail.notification?.length.toString();
  }
}
