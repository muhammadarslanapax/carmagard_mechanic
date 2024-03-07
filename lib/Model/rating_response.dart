import 'dart:convert';

/// status : "success"
/// data : {"overallRating":3.6666666666666665,"totalRatings":3,"ratingDistribution":{"1":0,"2":0,"3":2,"4":0,"5":1}}

/*RatingResponse ratingResponseFromJson(String str) =>
    RatingResponse.fromJson(json.decode(str));
String ratingResponseToJson(RatingResponse data) => json.encode(data.toJson());*/

class RatingResponse {
  RatingResponse({
    this.status,
    this.data,
  });

  RatingResponse.fromJson(dynamic json) {
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
    return 'RatingResponse{status: $status, data: $data}';
  }
}

/// overallRating : 3.6666666666666665
/// totalRatings : 3
/// ratingDistribution : {"1":0,"2":0,"3":2,"4":0,"5":1}
/*
Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());*/

class Data {
  Data({
    this.overallRating,
    this.totalRatings,
    this.ratingDistribution,
  });

  Data.fromJson(dynamic json) {
    overallRating = double.tryParse(json['overallRating'].toString());
    totalRatings = json['totalRatings'];
    ratingDistribution = json['ratingDistribution'] != null
        ? RatingDistribution.fromJson(json['ratingDistribution'])
        : null;
  }
  double? overallRating;
  int? totalRatings;
  RatingDistribution? ratingDistribution;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overallRating'] = overallRating;
    map['totalRatings'] = totalRatings;
    if (ratingDistribution != null) {
      map['ratingDistribution'] = ratingDistribution?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'Data{overallRating: $overallRating, totalRatings: $totalRatings, '
        'ratingDistribution: $ratingDistribution}';
  }
}

/// 1 : 0
/// 2 : 0
/// 3 : 2
/// 4 : 0
/// 5 : 1
/*
RatingDistribution ratingDistributionFromJson(String str) =>
    RatingDistribution.fromJson(json.decode(str));
String ratingDistributionToJson(RatingDistribution data) =>
    json.encode(data.toJson());*/

class RatingDistribution {
  RatingDistribution({
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
  });

  RatingDistribution.fromJson(dynamic json) {
    one = json['1'];
    two = json['2'];
    three = json['3'];
    four = json['4'];
    five = json['5'];
  }
  int? one;
  int? two;
  int? three;
  int? four;
  int? five;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['1'] = one;
    map['2'] = two;
    map['3'] = three;
    map['4'] = four;
    map['5'] = five;
    return map;
  }

  @override
  String toString() {
    return 'RatingDistribution{one: $one, two: $two, three: $three, '
        'four: $four, five: $five}';
  }
}
