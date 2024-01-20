// ignore_for_file: public_member_api_docs, sort_constructors_first

class orderModel {
  final String orderID;
  final String arrivalDate;
  final String ownerImage;
  var availableWeight;
  final String date;
  final String orderType;
  final String orderState;
  final String fromAddress;
  final String fromCity;
  final String fromGov;
  final String ownerName;
  final int ownerRate;
  final String productName;
  final String productImage;
  var productPrice;
  var productWeight;
  final String requestedUserId;
  var rewardAmount;
  final String toAddress;
  final String toCity;
  final String toGov;
  orderModel({
    required this.orderID,
    required this.arrivalDate,
    required this.availableWeight,
    required this.date,
    required this.fromAddress,
    required this.fromCity,
    required this.fromGov,
    required this.orderType,
    required this.orderState,
    required this.ownerName,
    required this.ownerImage,
    required this.ownerRate,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productWeight,
    required this.requestedUserId,
    required this.rewardAmount,
    required this.toAddress,
    required this.toCity,
    required this.toGov,
  });

  factory orderModel.fromJson(jsondata) {
    return orderModel(
        orderID: jsondata["orderId"],
        arrivalDate: jsondata["arrivalDate"],
        ownerImage: jsondata["ownerImage"],
        availableWeight: jsondata["availableWeight"],
        date: jsondata["date"],
        orderType: jsondata["orderType"],
        orderState: jsondata["orderState"],
        fromAddress: jsondata['fromAddress'],
        fromCity: jsondata["fromCity"],
        fromGov: jsondata["fromGov"],
        ownerName: jsondata["ownerName"],
        ownerRate: jsondata["ownerRate"],
        productName: jsondata["productName"],
        productImage: jsondata["orderImage"],
        productPrice: jsondata["productPrice"],
        productWeight: jsondata["productWeight"],
        requestedUserId: jsondata["requestedUserId"],
        rewardAmount: jsondata["rewardAmount"],
        toAddress: jsondata["toAddress"],
        toCity: jsondata["toCity"],
        toGov: jsondata["toGov"]);
  }
}
