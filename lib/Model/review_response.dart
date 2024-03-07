import 'dart:convert';

/// status : "success"
/// data : [{"mechanic":{"id":"6589cd26c850c86ac613383a","name":"James Hulk"},"service":{"id":"658dc7d8c2c649d7a0ecbae9","name":"Fan Belt Fix8"},"_id":"6599b6f624e3e5f4e70cf9e9","user":{"avatar":{"public_id":"cqfju0wngsg7aclltpa2","url":"https://res.cloudinary.com/drmicer90/image/upload/v1704700620/cqfju0wngsg7aclltpa2.jpg"},"_id":"6593e95cee27ddbbe21490f8","name":"Rounda Rousy","role":"user","isVerified":false,"createdAt":"2024-01-02T10:45:48.382Z"},"rating":3,"review":" think what you are trying to do is get a virtual property of the document that gets the average rating but it does not get persisted to the mongo database. according to mongoosejs","likes":[],"dislikes":[],"createdAt":"2024-01-06T20:24:22.867Z","updatedAt":"2024-01-06T20:24:22.867Z","__v":0},{"mechanic":{"id":"6589cd26c850c86ac613383a","name":"James Hulk"},"service":{"id":"658c9c743a4c53910090a34f","name":"Fuel meter guaging"},"_id":"6599b71a24e3e5f4e70cf9ec","user":{"avatar":{"public_id":"cqfju0wngsg7aclltpa2","url":"https://res.cloudinary.com/drmicer90/image/upload/v1704700620/cqfju0wngsg7aclltpa2.jpg"},"_id":"6593e95cee27ddbbe21490f8","name":"Rounda Rousy","role":"user","isVerified":false,"createdAt":"2024-01-02T10:45:48.382Z"},"rating":5,"review":" think what you are trying to do is get a virtual property of the document that gets the average rating but it does not get persisted to the mongo database. according to mongoosejs","likes":[],"dislikes":[],"createdAt":"2024-01-06T20:24:58.445Z","updatedAt":"2024-01-06T20:24:58.445Z","__v":0},{"mechanic":{"id":"6589cd26c850c86ac613383a","name":"James Hulk"},"service":{"id":"658c9c293a4c53910090a34b","name":"Air flow meter guaging"},"_id":"659bd8a951caefb61fd38d7e","user":{"avatar":{"public_id":"cqfju0wngsg7aclltpa2","url":"https://res.cloudinary.com/drmicer90/image/upload/v1704700620/cqfju0wngsg7aclltpa2.jpg"},"_id":"6593e95cee27ddbbe21490f8","name":"Rounda Rousy","role":"user","isVerified":false,"createdAt":"2024-01-02T10:45:48.382Z"},"rating":4,"review":"dfghj dfyhgjhk\nvjbkn","likes":[],"dislikes":[],"createdAt":"2024-01-08T11:12:41.091Z","updatedAt":"2024-01-08T11:12:41.091Z","__v":0}]

/*ReviewResponse reviewResponseFromJson(String str) =>
    ReviewResponse.fromJson(json.decode(str));
String reviewResponseToJson(ReviewResponse data) => json.encode(data.toJson());*/

class ReviewResponse {
  ReviewResponse({
    this.status,
    this.data,
  });

  ReviewResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ReviewData.fromJson(v));
      });
    }
  }
  String? status;
  List<ReviewData>? data;

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
    return 'ReviewResponse{status: $status, data: $data}';
  }
}

/// mechanic : {"id":"6589cd26c850c86ac613383a","name":"James Hulk"}
/// service : {"id":"658dc7d8c2c649d7a0ecbae9","name":"Fan Belt Fix8"}
/// _id : "6599b6f624e3e5f4e70cf9e9"
/// user : {"avatar":{"public_id":"cqfju0wngsg7aclltpa2","url":"https://res.cloudinary.com/drmicer90/image/upload/v1704700620/cqfju0wngsg7aclltpa2.jpg"},"_id":"6593e95cee27ddbbe21490f8","name":"Rounda Rousy","role":"user","isVerified":false,"createdAt":"2024-01-02T10:45:48.382Z"}
/// rating : 3
/// review : " think what you are trying to do is get a virtual property of the document that gets the average rating but it does not get persisted to the mongo database. according to mongoosejs"
/// likes : []
/// dislikes : []
/// createdAt : "2024-01-06T20:24:22.867Z"
/// updatedAt : "2024-01-06T20:24:22.867Z"
/// __v : 0

/*ReviewData reviewDataFromJson(String str) =>
    ReviewData.fromJson(json.decode(str));
String reviewDataToJson(ReviewData data) => json.encode(data.toJson());*/

class ReviewData {
  ReviewData({
    this.mechanic,
    this.service,
    this.id,
    this.user,
    this.rating,
    this.review,
    this.likes,
    this.dislikes,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  ReviewData.fromJson(dynamic json) {
    mechanic =
        json['mechanic'] != null ? Mechanic.fromJson(json['mechanic']) : null;
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    id = json['_id'];
    user = json['user'] != null ? ReviewUser.fromJson(json['user']) : null;
    rating = json['rating'];
    review = json['review'];
    if (json['likes'] != null) {
      likes = [];
      json['likes'].forEach((v) {
        likes?.add(v);
      });
    }
    if (json['dislikes'] != null) {
      dislikes = [];
      json['dislikes'].forEach((v) {
        dislikes?.add(v);
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  Mechanic? mechanic;
  Service? service;
  String? id;
  ReviewUser? user;
  int? rating;
  String? review;
  List<dynamic>? likes;
  List<dynamic>? dislikes;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (mechanic != null) {
      map['mechanic'] = mechanic?.toJson();
    }
    if (service != null) {
      map['service'] = service?.toJson();
    }
    map['_id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['rating'] = rating;
    map['review'] = review;
    if (likes != null) {
      map['likes'] = likes?.map((v) => v.toJson()).toList();
    }
    if (dislikes != null) {
      map['dislikes'] = dislikes?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  @override
  String toString() {
    return 'ReviewData{mechanic: $mechanic, service: $service, id: $id, '
        'user: $user, rating: $rating, review: $review, likes: $likes, '
        'dislikes: $dislikes, createdAt: $createdAt, updatedAt: $updatedAt, '
        'v: $v}';
  }
}

/// avatar : {"public_id":"cqfju0wngsg7aclltpa2","url":"https://res.cloudinary.com/drmicer90/image/upload/v1704700620/cqfju0wngsg7aclltpa2.jpg"}
/// _id : "6593e95cee27ddbbe21490f8"
/// name : "Rounda Rousy"
/// role : "user"
/// isVerified : false
/// createdAt : "2024-01-02T10:45:48.382Z"

/*ReviewUser reviewUserFromJson(String str) =>
    ReviewUser.fromJson(json.decode(str));
String reviewUserToJson(ReviewUser data) => json.encode(data.toJson());*/

class ReviewUser {
  ReviewUser({
    this.avatar,
    this.id,
    this.name,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  ReviewUser.fromJson(dynamic json) {
    avatar = json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null;
    id = json['_id'];
    name = json['name'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
  }
  Avatar? avatar;
  String? id;
  String? name;
  String? role;
  bool? isVerified;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (avatar != null) {
      map['avatar'] = avatar?.toJson();
    }
    map['_id'] = id;
    map['name'] = name;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    return map;
  }

  @override
  String toString() {
    return 'ReviewUser{avatar: $avatar, id: $id, name: $name, '
        'role: $role, isVerified: $isVerified, createdAt: $createdAt}';
  }
}

/// public_id : "cqfju0wngsg7aclltpa2"
/// url : "https://res.cloudinary.com/drmicer90/image/upload/v1704700620/cqfju0wngsg7aclltpa2.jpg"

/*Avatar avatarFromJson(String str) => Avatar.fromJson(json.decode(str));
String avatarToJson(Avatar data) => json.encode(data.toJson());*/

class Avatar {
  Avatar({
    this.publicId,
    this.url,
  });

  Avatar.fromJson(dynamic json) {
    publicId = json['public_id'];
    url = json['url'];
  }
  String? publicId;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = publicId;
    map['url'] = url;
    return map;
  }

  @override
  String toString() {
    return 'Avatar{publicId: $publicId, url: $url}';
  }
}

/// id : "658dc7d8c2c649d7a0ecbae9"
/// name : "Fan Belt Fix8"

/*Service serviceFromJson(String str) => Service.fromJson(json.decode(str));
String serviceToJson(Service data) => json.encode(data.toJson());*/

class Service {
  Service({
    this.id,
    this.name,
  });

  Service.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  @override
  String toString() {
    return 'Service{id: $id, name: $name}';
  }
}

/// id : "6589cd26c850c86ac613383a"
/// name : "James Hulk"

/*Mechanic mechanicFromJson(String str) => Mechanic.fromJson(json.decode(str));
String mechanicToJson(Mechanic data) => json.encode(data.toJson());*/

class Mechanic {
  Mechanic({
    this.id,
    this.name,
  });

  Mechanic.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  @override
  String toString() {
    return 'Mechanic{id: $id, name: $name}';
  }
}
