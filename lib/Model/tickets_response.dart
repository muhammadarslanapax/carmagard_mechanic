import 'dart:convert';

import 'ticket_response.dart';

/// status : "success"
/// data : [{"user":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","email":"user@gmail.com","role":"user"},"_id":"658f5925ab45b373d49ce7ea","subject":"Lo and behold","category":"Technical Issue","priority":"High","description":"Pls Work","attachments":[],"replies":[],"status":"Open","createdAt":"2023-12-29T23:41:25.713Z","updatedAt":"2023-12-29T23:41:25.713Z","__v":0},{"user":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","email":"user@gmail.com","role":"user"},"admin":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","email":"admin@gmail.com","role":"admin"},"_id":"658f5b582ce0d7cc6c3a5711","subject":"Service Malfunction","category":"Billing Issue","priority":"High","description":"Yo X","attachments":[{"public_id":"zdyijxf3s5ypkan2emzf","url":"https://res.cloudinary.com/drmicer90/image/upload/v1703893838/zdyijxf3s5ypkan2emzf.png","_id":"658f5b582ce0d7cc6c3a5712"}],"replies":[{"admin":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","role":"user"},"user":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","role":"user"},"from":"user","text":"Its fixed now","time":"2023-12-30T08:00:35.042Z","_id":"658fce23b1108bc3062e18eb"},{"admin":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","role":"admin"},"user":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","role":"admin"},"from":"admin","text":"Brof check your balance","time":"2023-12-30T08:02:02.006Z","_id":"658fce7ab1108bc3062e18f2"},{"admin":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","role":"admin"},"user":{"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","role":"admin"},"from":"admin","text":"Brof check your balance","time":"2023-12-30T08:03:20.910Z","_id":"658fcec8a01fea079f34e6c3"}],"status":"In Progress","createdAt":"2023-12-29T23:50:48.766Z","updatedAt":"2023-12-30T08:38:49.803Z","__v":0}]

TicketsResponse ticketsFromJson(String str) =>
    TicketsResponse.fromJson(json.decode(str));
// String ticketsToJson(TicketsResponse data) => json.encode(data.toJson());

class TicketsResponse {
  TicketsResponse({
    this.status,
    this.data,
  });

  TicketsResponse.fromJson(dynamic json) {
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
    return 'TicketsResponse{status: $status, data: $data}';
  }
}

/// Already defined
/*
/// user : {"id":"6589c8376d282cbaf68cb27d","name":"Stevolisis joseph","email":"user@gmail.com","role":"user"}
/// _id : "658f5925ab45b373d49ce7ea"
/// subject : "Lo and behold"
/// category : "Technical Issue"
/// priority : "High"
/// description : "Pls Work"
/// attachments : []
/// replies : []
/// status : "Open"
/// createdAt : "2023-12-29T23:41:25.713Z"
/// updatedAt : "2023-12-29T23:41:25.713Z"
/// __v : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.user,
    this.id,
    this.subject,
    this.category,
    this.priority,
    this.description,
    this.attachments,
    this.replies,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    id = json['_id'];
    subject = json['subject'];
    category = json['category'];
    priority = json['priority'];
    description = json['description'];
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments?.add(Attachments.fromJson(v));
      });
    }
    if (json['replies'] != null) {
      replies = [];
      json['replies'].forEach((v) {
        replies?.add(v);
      });
    }
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  User? user;
  String? id;
  String? subject;
  String? category;
  String? priority;
  String? description;
  List<dynamic>? attachments;
  List<dynamic>? replies;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['_id'] = id;
    map['subject'] = subject;
    map['category'] = category;
    map['priority'] = priority;
    map['description'] = description;
    if (attachments != null) {
      map['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    if (replies != null) {
      map['replies'] = replies?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
*/

/// id : "6589c8376d282cbaf68cb27d"
/// name : "Stevolisis joseph"
/// email : "user@gmail.com"
/// role : "user"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? id;
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, role: $role}';
  }
}
