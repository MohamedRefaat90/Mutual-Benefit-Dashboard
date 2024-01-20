// ignore_for_file: public_member_api_docs, sort_constructors_first

class userModel {
  final String accountStatus;
  final String accountType;
  final String date;
  final String email;
  final String imageUrl;
  final String mobileNumber;
  final String name;
  final double rate;
  final String userID;
  final String validationStatus;
  userModel({
    required this.accountStatus,
    required this.accountType,
    required this.date,
    required this.email,
    required this.imageUrl,
    required this.mobileNumber,
    required this.name,
    required this.rate,
    required this.userID,
    required this.validationStatus,
  });

  factory userModel.fromJson(jsondata) {
    return userModel(
        name: jsondata['name'],
        email: jsondata['email'],
        mobileNumber: jsondata['mobileNumber'],
        accountStatus: jsondata['accountStatus'],
        validationStatus: jsondata['validationStatus'],
        accountType: jsondata['accountType'],
        date: jsondata['date'],
        imageUrl: jsondata['imageURL'],
        rate: jsondata['rate'],
        userID: jsondata['userId']);
  }
}

