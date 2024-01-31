enum Company { royalEnfield, other }

// 9 models --> Source (Royal Enfield)
enum BulletModel {
  bullet350,
  classic350,
  hunter350,
  scram411,
  meteor350,
  superMeteor650,
  himalayan,
  newHimalayan,
  interceptor,
  continentalGT,
}

class VehicalDetail {
  VehicalDetail({
    required this.ownerName,
    this.status = "pending",
    this.vehicalId,
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
    this.rcNumber, // Change type to dynamic
    this.insuranceNumber, // Change type to dynamic
    this.meterPhoto,
    this.rcPhoto,
    this.insurancePhoto,
    this.bid,
  });
  String? vehicalId;
  String ownerName;
  String? number;
  String status; // can be pending, live or sold
  Company? company;
  BulletModel? model;
  String? estPrice;
  int? bid;
  int? yearOfRelese;
  int? yearOfPurchase;
  int? meterReading;
  String? meterPhoto;
  String? frontPhoto;
  String? sidePhoto;
  String? rearPhoto;
  String? tankPhoto;
  dynamic rcNumber; // Change type to dynamic
  String? rcPhoto;
  dynamic insuranceNumber; // Change type to dynamic
  String? insurancePhoto;
}
