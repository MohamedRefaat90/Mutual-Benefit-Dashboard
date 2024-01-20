// ignore_for_file: public_member_api_docs, sort_constructors_first
class VarificationRequsetModel {
  final String accountType;
  final String date;
  final String userID;
  var imageURL;
  VarificationRequsetModel({
    required this.accountType,
    required this.date,
    required this.userID,
    required this.imageURL,
  });

  factory VarificationRequsetModel.fromJson(jsonData) {
    return VarificationRequsetModel(
        accountType: jsonData["accountType"],
        date: jsonData["date"],
        userID: jsonData["userId"],
        imageURL: jsonData["imageURL"]
        );
  }
}
