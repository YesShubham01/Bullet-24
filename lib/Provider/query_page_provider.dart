import 'package:flutter/material.dart';

enum Company { royalEnfield, other }

enum BulletModel { model1, model2, model3, model4 }

class QueryPageProvider extends ChangeNotifier {
  String data;
  bool iscompanySelected;
  Company? chosenCompany;
  BulletModel? chosenModel;

  QueryPageProvider({
    this.data = "data",
    this.iscompanySelected = false,
  });

  setCompanyAsRoyalEnfield() {
    iscompanySelected = true;
    chosenCompany = Company.royalEnfield;
    notifyListeners();
  }

  setCompanyAsOthers() {
    iscompanySelected = true;
    chosenCompany = Company.other;
    notifyListeners();
  }

  setBulletModel(BulletModel option) {
    chosenModel = option;
  }
}
