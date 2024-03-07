import 'dart:convert';

import 'package:carmagard/Constant/utility_function.dart';

/// success : true
/// mechanic : {"_id":"6589cd26c850c86ac613383a","mechanicName":"James Hulk","email":"mechanic@gmail.com","password":"$2a$10$bCXoKkiBoFT2wiqwBzdM7.hldc2HKAyu9dAcTigbGT2YSzLsuGRJK","role":"mechanic","isVerified":false,"isPhoneVerified":false,"services":[{"_id":"658c9c743a4c53910090a34f","name":"Fuel meter guaging","productId":"prod_PGwxxxxxxttRBgr","priceId":"price_1OSOxxxxxxxpEIXDKWeFGig4X"}],"createdAt":"2023-12-25T18:42:46.314Z","updatedAt":"2023-12-29T21:06:24.574Z","__v":6,"address":"Calahoma, California, USA","firstName":"James","lastName":"Hulk","middleName":"Jet","phoneNumber":"+2348103987495","verificationCode":"7793"}
/// accessToken : "eyJhbGciOixxxxxxxxxxxcCI6IkpXVCJ9.eyJpZCI6IjY1ODljZDI2Yzg1MGM4NmFjNjEzMzgzYSIsIm5hbWUiOiJKYW1lcyBIdWxrIiwicm9sZSI6Im1lY2hhbmlxxxxxxxxxxxxxxNzAzOTI5NTc2LCJleHAiOjE3MDM5Mjk4NzZ9.HwtG6GQYgMcxXBKOxxxxxxxxxxxQIq3P4uqCdXBh4C6E"

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.success,
    this.mechanic,
    this.accessToken,
  });

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    mechanic =
        json['mechanic'] != null ? Mechanic.fromJson(json['mechanic']) : null;
    accessToken = json['accessToken'];
  }
  bool? success;
  Mechanic? mechanic;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (mechanic != null) {
      map['mechanic'] = mechanic?.toJson();
    }
    map['accessToken'] = accessToken;
    return map;
  }

  @override
  String toString() {
    return 'LoginResponse{success: $success, mechanic: $mechanic, accessToken: $accessToken}';
  }
}

/// _id : "6589cd26c850c86ac613383a"
/// mechanicName : "James Hulk"
/// email : "mechanic@gmail.com"
/// password : "$2a$10$bCXoKkiBoFT2wiqwBzdM7.hldc2HKAyu9dAcTigbGT2YSzLsuGRJK"
/// role : "mechanic"
/// isVerified : false
/// isPhoneVerified : false
/// services : [{"_id":"658c9c743a4c53910090a34f","name":"Fuel meter guaging","productId":"prod_PGwxxxxxxttRBgr","priceId":"price_1OSOxxxxxxxpEIXDKWeFGig4X"}]
/// createdAt : "2023-12-25T18:42:46.314Z"
/// updatedAt : "2023-12-29T21:06:24.574Z"
/// __v : 6
/// address : "Calahoma, California, USA"
/// firstName : "James"
/// lastName : "Hulk"
/// middleName : "Jet"
/// phoneNumber : "+2348103987495"
/// verificationCode : "7793"

Mechanic mechanicFromJson(String str) => Mechanic.fromJson(json.decode(str));
String mechanicToJson(Mechanic data) => json.encode(data.toJson());

class Mechanic {
  Mechanic({
    this.id,
    this.mechanicName,
    this.email,
    this.password,
    this.role,
    this.isVerified,
    this.isPhoneVerified,
    this.services,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.firstName,
    this.lastName,
    this.middleName,
    this.phoneNumber,
    this.verificationCode,
  });

  Mechanic.fromJson(dynamic json) {
    id = json['_id'];
    mechanicName = firstToUpperCase(json['mechanicName']);
    email = json['email'];
    password = json['password'];
    role = json['role'];
    isVerified = json['isVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(Services.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    address = json['address'];
    firstName = firstToUpperCase(json['firstName']);
    lastName = firstToUpperCase(json['lastName']);
    middleName = firstToUpperCase(json['middleName']);
    phoneNumber = json['phoneNumber'];
    verificationCode = json['verificationCode'];
  }
  String? id;
  String? mechanicName;
  String? email;
  String? password;
  String? role;
  bool? isVerified;
  bool? isPhoneVerified;
  List<Services>? services;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? address;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phoneNumber;
  String? verificationCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['mechanicName'] = mechanicName;
    map['email'] = email;
    map['password'] = password;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['isPhoneVerified'] = isPhoneVerified;
    if (services != null) {
      map['services'] = services?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['address'] = address;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['middleName'] = middleName;
    map['phoneNumber'] = phoneNumber;
    map['verificationCode'] = verificationCode;
    return map;
  }

  @override
  String toString() {
    return 'Mechanic{id: $id, mechanicName: $mechanicName, email: $email, '
        'password: $password, role: $role, isVerified: $isVerified, '
        'isPhoneVerified: $isPhoneVerified, services: $services, '
        'createdAt: $createdAt, updatedAt: $updatedAt, v: $v, '
        'address: $address, firstName: $firstName, lastName: $lastName, '
        'middleName: $middleName, phoneNumber: $phoneNumber, '
        'verificationCode: $verificationCode}';
  }
}

/// _id : "658c9c743a4c53910090a34f"
/// name : "Fuel meter guaging"
/// productId : "prod_PGwxxxxxxttRBgr"
/// priceId : "price_1OSOxxxxxxxpEIXDKWeFGig4X"

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));
String servicesToJson(Services data) => json.encode(data.toJson());

class Services {
  Services({
    this.id,
    this.name,
    this.productId,
    this.priceId,
  });

  Services.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    productId = json['productId'];
    priceId = json['priceId'];
  }
  String? id;
  String? name;
  String? productId;
  String? priceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['productId'] = productId;
    map['priceId'] = priceId;
    return map;
  }

  @override
  String toString() {
    return 'Services{id: $id, name: $name, productId: $productId, priceId: $priceId}';
  }
}
