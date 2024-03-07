import 'dart:convert';

/// success : true
/// serviceRequests : [{"_id":"65aab2452fb0ceb202c74dd2","mechanicId":{"location":{"type":"Point","coordinates":[7.0085,4.7731]},"_id":"659d80e5af84d3612a4755b7","mechanicName":"frank","email":"ebspcxrbg@emltmp.com","role":"mechanic","isVerified":false,"isPhoneVerified":false,"services":[{"_id":"65a1b92f96d2142d7e01c444","name":"Brake System Repair","productId":"prod_PMcBXh4CwL87JK","priceId":"price_1OXsxHC01lpEIXDKunXKrPbh"},{"_id":"6558b7e9b1b2dbde412454a4","name":"Car Servicing","productId":null,"priceId":null},{"_id":"6558b803b1b2dbde412454a8","name":"Car Repair","productId":null,"priceId":null},{"_id":"65a1b83396d2142d7e01c438","name":"Fan Belt Fix","productId":"prod_PMc7Bo4oBgeONt","priceId":"price_1OXstCC01lpEIXDKJXCe5KY5"}],"createdAt":"2024-01-09T17:22:45.883Z","updatedAt":"2024-01-20T01:57:47.046Z","__v":13,"address":"Block D7, Area 51","firstName":"Frank","lastName":"Ed","middleName":"Ward","phoneNumber":"+23409036384492","verificationCode":"1141"},"userId":"65a18e07cb01e1773639d16e","userName":"Obi","serviceId":{"_id":"6558b803b1b2dbde412454a8","name":"Car Repair","desc":"Fix your car","createdAt":"2023-11-18T13:11:31.486Z","updatedAt":"2023-11-18T13:11:31.486Z","__v":0},"request":"Just fix it","address":"Block A8","phoneNumber":9036384491,"isApproved":true,"isUrgent":true,"isPaid":false,"isCompleted":false,"date":"2024-01-19T17:32:53.563Z","time":"5:32:53 PM","createdAt":"2024-01-19T17:32:53.564Z","updatedAt":"2024-01-19T17:36:05.146Z","__v":0},{"_id":"65aab2492fb0ceb202c74dd5","mechanicId":{"location":{"type":"Point","coordinates":[7.0085,4.7731]},"_id":"659d80e5af84d3612a4755b7","mechanicName":"frank","email":"ebspcxrbg@emltmp.com","role":"mechanic","isVerified":false,"isPhoneVerified":false,"services":[{"_id":"65a1b92f96d2142d7e01c444","name":"Brake System Repair","productId":"prod_PMcBXh4CwL87JK","priceId":"price_1OXsxHC01lpEIXDKunXKrPbh"},{"_id":"6558b7e9b1b2dbde412454a4","name":"Car Servicing","productId":null,"priceId":null},{"_id":"6558b803b1b2dbde412454a8","name":"Car Repair","productId":null,"priceId":null},{"_id":"65a1b83396d2142d7e01c438","name":"Fan Belt Fix","productId":"prod_PMc7Bo4oBgeONt","priceId":"price_1OXstCC01lpEIXDKJXCe5KY5"}],"createdAt":"2024-01-09T17:22:45.883Z","updatedAt":"2024-01-20T01:57:47.046Z","__v":13,"address":"Block D7, Area 51","firstName":"Frank","lastName":"Ed","middleName":"Ward","phoneNumber":"+23409036384492","verificationCode":"1141"},"userId":"65a18e07cb01e1773639d16e","userName":"Obi","serviceId":{"_id":"6558b803b1b2dbde412454a8","name":"Car Repair","desc":"Fix your car","createdAt":"2023-11-18T13:11:31.486Z","updatedAt":"2023-11-18T13:11:31.486Z","__v":0},"request":"Just fix it","address":"Block A8","phoneNumber":9036384491,"isApproved":false,"isUrgent":true,"isPaid":false,"isCompleted":false,"date":"2024-01-19T17:32:57.060Z","time":"5:32:57 PM","createdAt":"2024-01-19T17:32:57.060Z","updatedAt":"2024-01-19T17:32:57.060Z","__v":0}]
/*
ServiceRequestResponse serviceRequestResponseFromJson(String str) =>
    ServiceRequestResponse.fromJson(json.decode(str));
String serviceRequestResponseToJson(ServiceRequestResponse data) =>
    json.encode(data.toJson());*/

class ServiceRequestResponse {
  ServiceRequestResponse({
    this.success,
    this.serviceRequests,
  });

  ServiceRequestResponse.fromJson(dynamic json) {
    success = json['success'];
    if (json['serviceRequests'] != null) {
      serviceRequests = [];
      json['serviceRequests'].forEach((v) {
        serviceRequests?.add(ServiceRequests.fromJson(v));
      });
    }
  }
  bool? success;
  List<ServiceRequests>? serviceRequests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (serviceRequests != null) {
      map['serviceRequests'] = serviceRequests?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'ServiceRequestResponse{success: $success, '
        'serviceRequests: $serviceRequests}';
  }
}

/// _id : "65aab2452fb0ceb202c74dd2"
/// mechanicId : {"location":{"type":"Point","coordinates":[7.0085,4.7731]},"_id":"659d80e5af84d3612a4755b7","mechanicName":"frank","email":"ebspcxrbg@emltmp.com","role":"mechanic","isVerified":false,"isPhoneVerified":false,"services":[{"_id":"65a1b92f96d2142d7e01c444","name":"Brake System Repair","productId":"prod_PMcBXh4CwL87JK","priceId":"price_1OXsxHC01lpEIXDKunXKrPbh"},{"_id":"6558b7e9b1b2dbde412454a4","name":"Car Servicing","productId":null,"priceId":null},{"_id":"6558b803b1b2dbde412454a8","name":"Car Repair","productId":null,"priceId":null},{"_id":"65a1b83396d2142d7e01c438","name":"Fan Belt Fix","productId":"prod_PMc7Bo4oBgeONt","priceId":"price_1OXstCC01lpEIXDKJXCe5KY5"}],"createdAt":"2024-01-09T17:22:45.883Z","updatedAt":"2024-01-20T01:57:47.046Z","__v":13,"address":"Block D7, Area 51","firstName":"Frank","lastName":"Ed","middleName":"Ward","phoneNumber":"+23409036384492","verificationCode":"1141"}
/// userId : "65a18e07cb01e1773639d16e"
/// userName : "Obi"
/// serviceId : {"_id":"6558b803b1b2dbde412454a8","name":"Car Repair","desc":"Fix your car","createdAt":"2023-11-18T13:11:31.486Z","updatedAt":"2023-11-18T13:11:31.486Z","__v":0}
/// request : "Just fix it"
/// address : "Block A8"
/// phoneNumber : 9036384491
/// isApproved : true
/// isUrgent : true
/// isPaid : false
/// isCompleted : false
/// date : "2024-01-19T17:32:53.563Z"
/// time : "5:32:53 PM"
/// createdAt : "2024-01-19T17:32:53.564Z"
/// updatedAt : "2024-01-19T17:36:05.146Z"
/// __v : 0

/*ServiceRequests serviceRequestsFromJson(String str) =>
    ServiceRequests.fromJson(json.decode(str));
String serviceRequestsToJson(ServiceRequests data) =>
    json.encode(data.toJson());*/

class ServiceRequests {
  ServiceRequests({
    this.id,
    this.mechanicId,
    this.userId,
    this.userName,
    this.serviceId,
    this.request,
    this.address,
    this.phoneNumber,
    this.isApproved,
    this.isUrgent,
    this.isPaid,
    this.isCompleted,
    this.date,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ServiceRequests.fromJson(dynamic json) {
    id = json['_id'];
    mechanicId = json['mechanicId'] != null
        ? MechanicId.fromJson(json['mechanicId'])
        : null;
    userId = json['userId'];
    userName = json['userName'];
    serviceId = json['serviceId'] != null
        ? ServiceId.fromJson(json['serviceId'])
        : null;
    request = json['request'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    isApproved = json['isApproved'];
    isUrgent = json['isUrgent'];
    isPaid = json['isPaid'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    time = json['time'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  MechanicId? mechanicId;
  String? userId;
  String? userName;
  ServiceId? serviceId;
  String? request;
  String? address;
  int? phoneNumber;
  bool? isApproved;
  bool? isUrgent;
  bool? isPaid;
  bool? isCompleted;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (mechanicId != null) {
      map['mechanicId'] = mechanicId?.toJson();
    }
    map['userId'] = userId;
    map['userName'] = userName;
    if (serviceId != null) {
      map['serviceId'] = serviceId?.toJson();
    }
    map['request'] = request;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    map['isApproved'] = isApproved;
    map['isUrgent'] = isUrgent;
    map['isPaid'] = isPaid;
    map['isCompleted'] = isCompleted;
    map['date'] = date;
    map['time'] = time;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  @override
  String toString() {
    return 'ServiceRequests{id: $id, mechanicId: $mechanicId, userId: $userId, '
        'userName: $userName, serviceId: $serviceId, request: $request, '
        'address: $address, phoneNumber: $phoneNumber, '
        'isApproved: $isApproved, isUrgent: $isUrgent, isPaid: $isPaid, '
        'isCompleted: $isCompleted, date: $date, time: $time, '
        'createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}

/// _id : "6558b803b1b2dbde412454a8"
/// name : "Car Repair"
/// desc : "Fix your car"
/// createdAt : "2023-11-18T13:11:31.486Z"
/// updatedAt : "2023-11-18T13:11:31.486Z"
/// __v : 0

/*
ServiceId serviceIdFromJson(String str) => ServiceId.fromJson(json.decode(str));
String serviceIdToJson(ServiceId data) => json.encode(data.toJson());
*/

class ServiceId {
  ServiceId({
    this.id,
    this.name,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ServiceId.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    desc = json['desc'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? desc;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['desc'] = desc;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  @override
  String toString() {
    return 'ServiceId{id: $id, name: $name, desc: $desc, '
        'createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}

/// location : {"type":"Point","coordinates":[7.0085,4.7731]}
/// _id : "659d80e5af84d3612a4755b7"
/// mechanicName : "frank"
/// email : "ebspcxrbg@emltmp.com"
/// role : "mechanic"
/// isVerified : false
/// isPhoneVerified : false
/// services : [{"_id":"65a1b92f96d2142d7e01c444","name":"Brake System Repair","productId":"prod_PMcBXh4CwL87JK","priceId":"price_1OXsxHC01lpEIXDKunXKrPbh"},{"_id":"6558b7e9b1b2dbde412454a4","name":"Car Servicing","productId":null,"priceId":null},{"_id":"6558b803b1b2dbde412454a8","name":"Car Repair","productId":null,"priceId":null},{"_id":"65a1b83396d2142d7e01c438","name":"Fan Belt Fix","productId":"prod_PMc7Bo4oBgeONt","priceId":"price_1OXstCC01lpEIXDKJXCe5KY5"}]
/// createdAt : "2024-01-09T17:22:45.883Z"
/// updatedAt : "2024-01-20T01:57:47.046Z"
/// __v : 13
/// address : "Block D7, Area 51"
/// firstName : "Frank"
/// lastName : "Ed"
/// middleName : "Ward"
/// phoneNumber : "+23409036384492"
/// verificationCode : "1141"
/*
MechanicId mechanicIdFromJson(String str) =>
    MechanicId.fromJson(json.decode(str));
String mechanicIdToJson(MechanicId data) => json.encode(data.toJson());*/

class MechanicId {
  MechanicId({
    this.location,
    this.id,
    this.mechanicName,
    this.email,
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

  MechanicId.fromJson(dynamic json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    id = json['_id'];
    mechanicName = json['mechanicName'];
    email = json['email'];
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
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    phoneNumber = json['phoneNumber'];
    verificationCode = json['verificationCode'];
  }
  Location? location;
  String? id;
  String? mechanicName;
  String? email;
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
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['_id'] = id;
    map['mechanicName'] = mechanicName;
    map['email'] = email;
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
    return 'MechanicId{location: $location, id: $id, '
        'mechanicName: $mechanicName, email: $email, '
        'role: $role, isVerified: $isVerified, '
        'isPhoneVerified: $isPhoneVerified, '
        'services: $services, createdAt: $createdAt, '
        'updatedAt: $updatedAt, v: $v, address: $address, '
        'firstName: $firstName, lastName: $lastName, '
        'middleName: $middleName, phoneNumber: $phoneNumber, '
        'verificationCode: $verificationCode}';
  }
}

/// _id : "65a1b92f96d2142d7e01c444"
/// name : "Brake System Repair"
/// productId : "prod_PMcBXh4CwL87JK"
/// priceId : "price_1OXsxHC01lpEIXDKunXKrPbh"

/*Services servicesFromJson(String str) => Services.fromJson(json.decode(str));
String servicesToJson(Services data) => json.encode(data.toJson());*/

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
}

/// type : "Point"
/// coordinates : [7.0085,4.7731]

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  Location.fromJson(dynamic json) {
    type = json['type'];
    coordinates =
        json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }
  String? type;
  List<double>? coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }

  @override
  String toString() {
    return 'Location{type: $type, coordinates: $coordinates}';
  }
}
