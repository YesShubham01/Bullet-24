import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:flutter/material.dart';

class QueryPageProvider extends ChangeNotifier {
  String data;
  bool isCompanySelected;
  VehicalDetail? myVehical;
  bool allowNext;

  QueryPageProvider({
    this.data = "data",
    this.isCompanySelected = false,
    this.allowNext = false,
  });

  setAllowNext(bool allow) {
    allowNext = allow;
  }

  checkInitialisationOfVehical() {
    if (myVehical == null) {
      initialiseVehicalDetail();
    }
  }

  initialiseVehicalDetail() {
    // fetch username to use here
    myVehical = VehicalDetail(ownerName: "Name");

    // some default values
    myVehical!.yearOfPurchase = 2000;
    myVehical!.yearOfRelese = 2000;
  }

  void setCompanyOfVehical(Company? option) {
    checkInitialisationOfVehical();
    isCompanySelected = true;
    myVehical!.company = option;
    notifyListeners();
  }

  void setBulletModel(BulletModel option) {
    checkInitialisationOfVehical();
    myVehical!.model = option;
    notifyListeners();
  }

  void setYearOfRelease(int option) {
    checkInitialisationOfVehical();
    myVehical!.yearOfRelese = option;
    notifyListeners();
  }

  void setYearOfPurchase(int option) {
    checkInitialisationOfVehical();
    myVehical!.yearOfPurchase = option;
    notifyListeners();
  }

  // Method to set meterReading based on input
  void setMeterReading(int reading) {
    checkInitialisationOfVehical();
    myVehical!.meterReading = reading;
    notifyListeners();
  }

  void setFrontImage(String link) {
    checkInitialisationOfVehical();
    myVehical!.frontPhoto = link;
    print("~~~ Front photo set on provider Shubham. ~~~~ \n\n\n\n");
    notifyListeners();
  }

  void setSideImage(String link) {
    checkInitialisationOfVehical();
    myVehical!.sidePhoto = link;
    notifyListeners();
  }

  void setRearImage(String link) {
    checkInitialisationOfVehical();
    myVehical!.rearPhoto = link;
    notifyListeners();
  }

  void setMeterImage(String link) {
    checkInitialisationOfVehical();
    myVehical!.meterPhoto = link;
    notifyListeners();
  }

  void setTankImage(String link) {
    checkInitialisationOfVehical();
    myVehical!.meterPhoto = link;
    notifyListeners();
  }

  void setRcImage(String link) {
    checkInitialisationOfVehical();
    myVehical!.rcPhoto = link;
    notifyListeners();
  }

  void setInsuranceImage(String link) {
    checkInitialisationOfVehical();
    myVehical!.insurancePhoto = link;
    notifyListeners();
  }
}
