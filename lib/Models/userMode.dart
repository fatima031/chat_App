class UserModel {
  String? uid;
  String? fullName;
  String? email;
  String? profileImage;

  UserModel({this.uid, this.fullName, this.email, this.profileImage, required String fullname});

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["Uid"];
    fullName = map["Full Name"];
    email = map["email"];
    profileImage = map["profile Image"];
  }

  get profilepic => null;

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullName": fullName,
      "email": email,
      "profile": profileImage
    };
  }
}
