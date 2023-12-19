class UserDetail {
  String? uid;
  String? name;
  String? phone;
  String? profileImage;
  List<String>? notification;
  List<String>? active;

  UserDetail({
    this.name,
    this.phone,
    this.profileImage,
    this.notification,
    this.active,
    this.uid,
  });
}
