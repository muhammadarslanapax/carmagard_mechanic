import 'dart:convert';

import 'tickets_response.dart';

/// status : "success"
/// data : {"user":{"id":"659d80e5af84d3612a4755b7","name":"frank","email":"ebspcxrbg@emltmp.com","role":"mechanic"},"_id":"65a34a89ef254692a930440e","subject":"I need a reply","category":"technical_issue","priority":"high","description":"Reply fast, thanks.","attachments":[{"public_id":"heqosqr0g6mwxerompiv","url":"https://res.cloudinary.com/drmicer90/image/upload/v1705200265/heqosqr0g6mwxerompiv.png","_id":"65a34a89ef254692a930440f"}],"replies":[{"user":{"id":"659d80e5af84d3612a4755b7","name":"frank","role":"mechanic"},"from":"mechanic","text":"Ya, right.\r\n","attachments":[{"public_id":"heqosqr0g6mwxerompiv","url":"https://res.cloudinary.com/drmicer90/image/upload/v1705200265/heqosqr0g6mwxerompiv.png","_id":"65a34a89ef254692a930440f"}],"time":"2024-01-14T03:01:49.939Z","_id":"65a34e9def254692a9304420"}],"status":"Open","createdAt":"2024-01-14T02:44:25.904Z","updatedAt":"2024-01-14T03:01:49.939Z","__v":0}

SingleTicketResponse ticketResponseFromJson(String str) =>
    SingleTicketResponse.fromJson(json.decode(str));
String ticketResponseToJson(SingleTicketResponse data) =>
    json.encode(data.toJson());

class SingleTicketResponse {
  SingleTicketResponse({
    this.status,
    this.data,
  });

  SingleTicketResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'SingleTicketResponse{status: $status, data: $data}';
  }
}

/// user : {"id":"659d80e5af84d3612a4755b7","name":"frank","email":"ebspcxrbg@emltmp.com","role":"mechanic"}
/// _id : "65a34a89ef254692a930440e"
/// subject : "I need a reply"
/// category : "technical_issue"
/// priority : "high"
/// description : "Reply fast, thanks."
/// attachments : [{"public_id":"heqosqr0g6mwxerompiv","url":"https://res.cloudinary.com/drmicer90/image/upload/v1705200265/heqosqr0g6mwxerompiv.png","_id":"65a34a89ef254692a930440f"}]
/// replies : [{"user":{"id":"659d80e5af84d3612a4755b7","name":"frank","role":"mechanic"},"from":"mechanic","text":"Ya, right.\r\n","attachments":[{"public_id":"heqosqr0g6mwxerompiv","url":"https://res.cloudinary.com/drmicer90/image/upload/v1705200265/heqosqr0g6mwxerompiv.png","_id":"65a34a89ef254692a930440f"}],"time":"2024-01-14T03:01:49.939Z","_id":"65a34e9def254692a9304420"}]
/// status : "Open"
/// createdAt : "2024-01-14T02:44:25.904Z"
/// updatedAt : "2024-01-14T03:01:49.939Z"
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
        replies?.add(Replies.fromJson(v));
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
  List<Attachments>? attachments;
  List<Replies>? replies;
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

  @override
  String toString() {
    return 'Data{user: $user, id: $id, subject: $subject, category: $category, '
        'priority: $priority, description: $description, '
        'attachments: $attachments, replies: $replies, '
        'status: $status, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}

/// user : {"id":"659d80e5af84d3612a4755b7","name":"frank","role":"mechanic"}
/// from : "mechanic"
/// text : "Ya, right.\r\n"
/// attachments : [{"public_id":"heqosqr0g6mwxerompiv","url":"https://res.cloudinary.com/drmicer90/image/upload/v1705200265/heqosqr0g6mwxerompiv.png","_id":"65a34a89ef254692a930440f"}]
/// time : "2024-01-14T03:01:49.939Z"
/// _id : "65a34e9def254692a9304420"

Replies repliesFromJson(String str) => Replies.fromJson(json.decode(str));
String repliesToJson(Replies data) => json.encode(data.toJson());

class Replies {
  Replies({
    this.user,
    this.from,
    this.text,
    this.attachments,
    this.time,
    this.id,
  });

  Replies.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    from = json['from'];
    text = json['text'];
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments?.add(Attachments.fromJson(v));
      });
    }
    time = json['time'];
    id = json['_id'];
  }
  User? user;
  String? from;
  String? text;
  List<Attachments>? attachments;
  String? time;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['from'] = from;
    map['text'] = text;
    if (attachments != null) {
      map['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    map['time'] = time;
    map['_id'] = id;
    return map;
  }

  @override
  String toString() {
    return 'Replies{user: $user, from: $from, text: $text, '
        'attachments: $attachments, time: $time, id: $id}';
  }
}

/// public_id : "heqosqr0g6mwxerompiv"
/// url : "https://res.cloudinary.com/drmicer90/image/upload/v1705200265/heqosqr0g6mwxerompiv.png"
/// _id : "65a34a89ef254692a930440f"

Attachments attachmentsFromJson(String str) =>
    Attachments.fromJson(json.decode(str));
String attachmentsToJson(Attachments data) => json.encode(data.toJson());

class Attachments {
  Attachments({
    this.publicId,
    this.url,
    this.id,
  });

  Attachments.fromJson(dynamic json) {
    publicId = json['public_id'];
    url = json['url'];
    id = json['_id'];
  }
  String? publicId;
  String? url;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['public_id'] = publicId;
    map['url'] = url;
    map['_id'] = id;
    return map;
  }

  @override
  String toString() {
    return 'Attachments{publicId: $publicId, url: $url, id: $id}';
  }
}

/// Already defined
/*
/// id : "659d80e5af84d3612a4755b7"
/// name : "frank"
/// role : "mechanic"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.role,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
  }
  String? id;
  String? name;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['role'] = role;
    return map;
  }
}*/
