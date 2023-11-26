import 'package:bullet24/Objects/user_detail.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  bool isLoggined;
  UserDetail userDetail = UserDetail();

  MyProvider({
    this.isLoggined = false,
  });

  isUserNameNull() {
    if (userDetail.name == null) {
      return true;
    }
    return false;
  }

  setUserName(String? val) {
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
}
