enum Company { royalEnfield, other }

enum BulletModel { model1, model2, model3, model4 }

class VehicalDetail {
  VehicalDetail({
    this.number,
    this.company,
    this.estPrice,
    this.meterReading,
    this.model,
    this.yearOfPurchase,
    this.yearOfRelese,
    required this.ownerName,
  });
  String ownerName;
  String? number;
  Company? company;
  BulletModel? model;
  String? estPrice;
  int? yearOfRelese;
  int? yearOfPurchase;
  int? meterReading;
}
