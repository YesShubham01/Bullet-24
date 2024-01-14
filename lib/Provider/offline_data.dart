import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  List<VehicalDetail>? catalogue_vehical;

  setCatalogue(List<VehicalDetail> list) {
    catalogue_vehical = list;
    notifyListeners();
  }

  List<String> searchCatalogue(String query) {
    if (catalogue_vehical == null) {
      return [];
    }

    return catalogue_vehical!
        .where((vehicle) => bulletModelToStringMap[vehicle.model]!
            .toLowerCase()
            .contains(query.toLowerCase()))
        .map((vehicle) => bulletModelToStringMap[vehicle.model]!)
        .toList();
  }

  List<VehicalDetail> getsearchCatalogue(String query) {
    if (catalogue_vehical == null) {
      return [];
    }

    List<VehicalDetail> searchResults = catalogue_vehical!
        .where((vehicle) => bulletModelToStringMap[vehicle.model]!
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    print("Search Results:");
    for (var vehicle in searchResults) {
      print("${vehicle.model}: ${bulletModelToStringMap[vehicle.model]}");
    }
    return searchResults;
  }

  Map<BulletModel, String> bulletModelToStringMap = {
    BulletModel.bullet350: 'Bullet 350',
    BulletModel.classic350: 'Classic 350',
    BulletModel.hunter350: 'Hunter 350',
    BulletModel.scram411: 'Scram 411',
    BulletModel.meteor350: 'Meteor 350',
    BulletModel.superMeteor650: 'Super Meteor 650',
    BulletModel.himalayan: 'Himalayan',
    BulletModel.newHimalayan: 'New Himalayan',
    BulletModel.interceptor: 'Interceptor',
    BulletModel.continentalGT: 'Continental GT',
  };
}
