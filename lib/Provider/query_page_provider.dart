import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:flutter/material.dart';

class QueryPageProvider extends ChangeNotifier {
  String data;
  bool isCompanySelected;
  VehicalDetail? myVehical;

  QueryPageProvider({
    this.data = "data",
    this.isCompanySelected = false,
  });

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

  setCompanyOfVehical(Company? option) {
    checkInitialisationOfVehical();
    isCompanySelected = true;
    myVehical!.company = option;
    notifyListeners();
  }

  setBulletModel(BulletModel option) {
    checkInitialisationOfVehical();
    myVehical!.model = option;
    notifyListeners();
  }

  setYearOfRelease(int option) {
    checkInitialisationOfVehical();
    myVehical!.yearOfRelese = option;
    notifyListeners();
  }

  setYearOfPurchase(int option) {
    checkInitialisationOfVehical();
    myVehical!.yearOfPurchase = option;
    notifyListeners();
  }

  // Method to set meterReading based on input
  setMeterReading(int reading) {
    checkInitialisationOfVehical();
    myVehical!.meterReading = reading;
    notifyListeners();
  }
}
