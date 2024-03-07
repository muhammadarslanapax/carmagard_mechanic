class AutoCompleteResult {
  String? name;
  String? productId;
  String? id;
  String? priceId;

  AutoCompleteResult({
    this.name,
    this.productId,
    this.id,
    this.priceId,
  });

  AutoCompleteResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    priceId = json['priceId'];
    id = json['id'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['priceId'] = priceId;
    data['id'] = id;
    data['productId'] = productId;
    return data;
  }
}

class MatchedSubstrings {
  int? length;
  int? offset;

  MatchedSubstrings({this.length, this.offset});

  MatchedSubstrings.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['length'] = length;
    data['offset'] = offset;
    return data;
  }
}

class StructuredFormatting {
  String? mainText;
  List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings;
  String? secondaryText;

  StructuredFormatting(
      {this.mainText, this.mainTextMatchedSubstrings, this.secondaryText});

  StructuredFormatting.fromJson(Map<String, dynamic> json) {
    mainText = json['main_text'];
    if (json['main_text_matched_substrings'] != null) {
      mainTextMatchedSubstrings = <MainTextMatchedSubstrings>[];
      json['main_text_matched_substrings'].forEach((v) {
        mainTextMatchedSubstrings!.add(MainTextMatchedSubstrings.fromJson(v));
      });
    }
    secondaryText = json['secondary_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['main_text'] = this.mainText;
    if (this.mainTextMatchedSubstrings != null) {
      data['main_text_matched_substrings'] =
          mainTextMatchedSubstrings!.map((v) => v.toJson()).toList();
    }
    data['secondary_text'] = this.secondaryText;
    return data;
  }
}

class Terms {
  int? offset;
  String? value;

  Terms({this.offset, this.value});

  Terms.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['offset'] = this.offset;
    data['value'] = this.value;
    return data;
  }
}

class SecondaryTextMatchedSubstrings {
  int? length;
  int? offset;

  SecondaryTextMatchedSubstrings({this.length, this.offset});

  SecondaryTextMatchedSubstrings.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['length'] = this.length;
    data['offset'] = this.offset;
    return data;
  }
}

class MainTextMatchedSubstrings {
  int? length;
  int? offset;

  MainTextMatchedSubstrings({this.length, this.offset});

  MainTextMatchedSubstrings.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['length'] = this.length;
    data['offset'] = this.offset;
    return data;
  }
}
