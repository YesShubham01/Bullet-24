enum Company { royalEnfield, other }

enum BulletModel { model1, model2, model3, model4 }

class VehicalDetail {
  VehicalDetail({
    required this.ownerName,
    this.number,
    this.company,
    this.estPrice,
    this.meterReading,
    this.model,
    this.yearOfPurchase,
    this.yearOfRelese,
    this.frontPhoto,
    this.sidePhoto,
    this.rearPhoto,
    this.tankPhoto,
    this.rcNumber,
    this.insuranceDetails,
  });

  String ownerName;
  String? number;
  Company? company;
  BulletModel? model;
  String? estPrice;
  int? yearOfRelese;
  int? yearOfPurchase;
  int? meterReading;
  String? frontPhoto;
  String? sidePhoto;
  String? rearPhoto;
  String? tankPhoto;
  String? rcNumber;
  String? insuranceDetails;
}
