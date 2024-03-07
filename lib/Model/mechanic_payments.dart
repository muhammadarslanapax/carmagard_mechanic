import 'dart:convert';

/// status : "success"
/// data : [{"_id":"6581f05xxxxxxxxx33892e0","uid":"6581eaxxxxxxxxxxb5f0449e","session_id":"cs_test_a15UxxxxxxxxxxxxxxxrbzmUmfla9aLP44KG2EtnXAvSN8yj9cb2mVKG","amount_subtotal":34.66,"amount_total":34.66,"payment_method":"card","stripe_product_id":null,"payment_status":"paid","time_of_transaction":"2023-12-19T19:27:12.000Z","createdAt":"2023-12-19T19:34:54.059Z","updatedAt":"2023-12-19T19:34:54.059Z","__v":0},{"_id":"6581xxxxxxxxxx1a633892e3","uid":"6581exxxxxxxxxx04b5f0449e","session_id":"cs_test_a1ixxxxxxxxxxxxxITFOOfEZXualZpALii4ohQZpdXUcVCokXOXlwM2tXh","amount_subtotal":34.66,"amount_total":34.66,"payment_method":"card","stripe_product_id":null,"payment_status":"paid","time_of_transaction":"2023-12-19T19:35:42.000Z","createdAt":"2023-12-19T19:39:28.220Z","updatedAt":"2023-12-19T19:39:28.220Z","__v":0},null]

MechanicPayments mechanicPaymentsFromJson(String str) =>
    MechanicPayments.fromJson(json.decode(str));
String mechanicPaymentsToJson(MechanicPayments data) =>
    json.encode(data.toJson());

class MechanicPayments {
  MechanicPayments({
    this.status,
    this.data,
  });

  MechanicPayments.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'MechanicPayments{status: $status, data: $data}';
  }
}

/// _id : "6581f05xxxxxxxxx33892e0"
/// uid : "6581eaxxxxxxxxxxb5f0449e"
/// session_id : "cs_test_a15UxxxxxxxxxxxxxxxrbzmUmfla9aLP44KG2EtnXAvSN8yj9cb2mVKG"
/// amount_subtotal : 34.66
/// amount_total : 34.66
/// payment_method : "card"
/// stripe_product_id : null
/// payment_status : "paid"
/// time_of_transaction : "2023-12-19T19:27:12.000Z"
/// createdAt : "2023-12-19T19:34:54.059Z"
/// updatedAt : "2023-12-19T19:34:54.059Z"
/// __v : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.id,
    this.uid,
    this.sessionId,
    this.amountSubtotal,
    this.amountTotal,
    this.paymentMethod,
    this.stripeProductId,
    this.paymentStatus,
    this.timeOfTransaction,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    uid = json['uid'];
    sessionId = json['session_id'];
    amountSubtotal = json['amount_subtotal'];
    amountTotal = json['amount_total'];
    paymentMethod = json['payment_method'];
    stripeProductId = json['stripe_product_id'];
    paymentStatus = json['payment_status'];
    timeOfTransaction = json['time_of_transaction'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? uid;
  String? sessionId;
  double? amountSubtotal;
  double? amountTotal;
  String? paymentMethod;
  dynamic stripeProductId;
  String? paymentStatus;
  String? timeOfTransaction;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['uid'] = uid;
    map['session_id'] = sessionId;
    map['amount_subtotal'] = amountSubtotal;
    map['amount_total'] = amountTotal;
    map['payment_method'] = paymentMethod;
    map['stripe_product_id'] = stripeProductId;
    map['payment_status'] = paymentStatus;
    map['time_of_transaction'] = timeOfTransaction;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  @override
  String toString() {
    return 'Data{id: $id, uid: $uid, sessionId: $sessionId, '
        'amountSubtotal: $amountSubtotal, amountTotal: $amountTotal, '
        'paymentMethod: $paymentMethod, stripeProductId: $stripeProductId, '
        'paymentStatus: $paymentStatus, timeOfTransaction: $timeOfTransaction, '
        'createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}
