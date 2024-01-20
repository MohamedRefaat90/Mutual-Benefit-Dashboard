// ignore_for_file: public_member_api_docs, sort_constructors_first
class AdminModel {
  final String image;
  final String state;
  final String email;
  final String id;
  final String name;
  final String phone;
  final String password;
  final String type;
  AdminModel({
    required this.image,
    required this.state,
    required this.email,
    required this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.type,
  });

  factory AdminModel.fromJson(jsonData) {
    return AdminModel(
        image: jsonData["Image"],
        state: jsonData["State"],
        type: jsonData["type"],
        email: jsonData["email"],
        id: jsonData['id'],
        name: jsonData["name"],
        phone: jsonData['number'],
        password: jsonData['password']);
  }
}
