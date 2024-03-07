import 'dart:convert';

/// success : true
/// services : [{"_id":"658c9c743a4c53910090a34f","name":"Fuel meter guaging","productId":"prod_PGxxxxxxuttRBgr","priceId":"price_1OSxxxxxxxpEIXDKWeFGig4X","product":{"id":"prod_PGxxxxxxxuttRBgr","object":"product","active":true,"attributes":[],"created":1703788386,"default_price":"price_1OSxxxxxxxxpEIXDKWeFGig4X","description":"Get you fan belt fixed in no time","features":[],"images":[],"livemode":false,"metadata":{},"name":"Fan Belt Fix7","package_dimensions":null,"shippable":null,"statement_descriptor":null,"tax_code":null,"type":"service","unit_label":null,"updated":1703788387,"url":null,"prices":[{"id":"price_1OSxxxxxxxxpEIXDKWeFGig4X","object":"price","active":true,"billing_scheme":"per_unit","created":1703788386,"currency":"usd","custom_unit_amount":null,"livemode":false,"lookup_key":null,"metadata":{},"nickname":null,"product":"prod_PGwxxxxxxttRBgr","recurring":null,"tax_behavior":"unspecified","tiers_mode":null,"transform_quantity":null,"type":"one_time","unit_amount":6357,"unit_amount_decimal":"6357"}]}}]

/*ServiceResponse serviceResponseFromJson(String str) =>
    ServiceResponse.fromJson(json.decode(str));
String serviceResponseToJson(ServiceResponse data) =>
    json.encode(data.toJson());*/

/*class SystemServiceResponse {
  SystemServiceResponse({
    this.success,
    this.services,
  });
}*/

/// Th
class ServiceResponse {
  ServiceResponse({
    this.success,
    this.services,
  });

  ServiceResponse.fromJson(dynamic json) {
    success = json['success'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(Services.fromJson(v));
      });
    }
  }
  bool? success;
  List<Services>? services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (services != null) {
      map['services'] = services?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'ServiceResponse{success: $success, services: $services}';
  }
}

/// _id : "658c9c743a4c53910090a34f"
/// name : "Fuel meter guaging"
/// productId : "prod_PGxxxxxxuttRBgr"
/// priceId : "price_1OSxxxxxxxpEIXDKWeFGig4X"
/// product : {"id":"prod_PGxxxxxxxuttRBgr","object":"product","active":true,"attributes":[],"created":1703788386,"default_price":"price_1OSxxxxxxxxpEIXDKWeFGig4X","description":"Get you fan belt fixed in no time","features":[],"images":[],"livemode":false,"metadata":{},"name":"Fan Belt Fix7","package_dimensions":null,"shippable":null,"statement_descriptor":null,"tax_code":null,"type":"service","unit_label":null,"updated":1703788387,"url":null,"prices":[{"id":"price_1OSxxxxxxxxpEIXDKWeFGig4X","object":"price","active":true,"billing_scheme":"per_unit","created":1703788386,"currency":"usd","custom_unit_amount":null,"livemode":false,"lookup_key":null,"metadata":{},"nickname":null,"product":"prod_PGwxxxxxxttRBgr","recurring":null,"tax_behavior":"unspecified","tiers_mode":null,"transform_quantity":null,"type":"one_time","unit_amount":6357,"unit_amount_decimal":"6357"}]}

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));
String servicesToJson(Services data) => json.encode(data.toJson());

class Services {
  Services({
    this.id,
    this.name,
    this.productId,
    this.priceId,
    this.product,
  });

  Services.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    productId = json['productId'];
    priceId = json['priceId'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  String? id;
  String? name;
  String? productId;
  String? priceId;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['productId'] = productId;
    map['priceId'] = priceId;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

  Map<String, dynamic> addToJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['productId'] = productId;
    map['priceId'] = priceId;
    return map;
  }

  @override
  String toString() {
    return 'Services{id: $id, name: $name, productId: $productId, '
        'priceId: $priceId, product: $product}';
  }
}

/// id : "prod_PGxxxxxxxuttRBgr"
/// object : "product"
/// active : true
/// attributes : []
/// created : 1703788386
/// default_price : "price_1OSxxxxxxxxpEIXDKWeFGig4X"
/// description : "Get you fan belt fixed in no time"
/// features : []
/// images : []
/// livemode : false
/// metadata : {}
/// name : "Fan Belt Fix7"
/// package_dimensions : null
/// shippable : null
/// statement_descriptor : null
/// tax_code : null
/// type : "service"
/// unit_label : null
/// updated : 1703788387
/// url : null
/// prices : [{"id":"price_1OSxxxxxxxxpEIXDKWeFGig4X","object":"price","active":true,"billing_scheme":"per_unit","created":1703788386,"currency":"usd","custom_unit_amount":null,"livemode":false,"lookup_key":null,"metadata":{},"nickname":null,"product":"prod_PGwxxxxxxttRBgr","recurring":null,"tax_behavior":"unspecified","tiers_mode":null,"transform_quantity":null,"type":"one_time","unit_amount":6357,"unit_amount_decimal":"6357"}]

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.object,
    this.active,
    this.attributes,
    this.created,
    this.defaultPrice,
    this.description,
    this.features,
    this.images,
    this.livemode,
    this.metadata,
    this.name,
    this.packageDimensions,
    this.shippable,
    this.statementDescriptor,
    this.taxCode,
    this.type,
    this.unitLabel,
    this.updated,
    this.url,
    this.prices,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes?.add(v);
      });
    }
    created = json['created'];
    defaultPrice = json['default_price'];
    description = json['description'];
    if (json['features'] != null) {
      features = [];
      json['features'].forEach((v) {
        features?.add(v);
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(v);
      });
    }
    livemode = json['livemode'];
    metadata = json['metadata'];
    name = json['name'];
    packageDimensions = json['package_dimensions'];
    shippable = json['shippable'];
    statementDescriptor = json['statement_descriptor'];
    taxCode = json['tax_code'];
    type = json['type'];
    unitLabel = json['unit_label'];
    updated = json['updated'];
    url = json['url'];
    if (json['prices'] != null) {
      prices = [];
      json['prices'].forEach((v) {
        prices?.add(Prices.fromJson(v));
      });
    }
  }
  String? id;
  String? object;
  bool? active;
  List<dynamic>? attributes;
  int? created;
  String? defaultPrice;
  String? description;
  List<dynamic>? features;
  List<dynamic>? images;
  bool? livemode;
  dynamic metadata;
  String? name;
  dynamic packageDimensions;
  dynamic shippable;
  dynamic statementDescriptor;
  dynamic taxCode;
  String? type;
  dynamic unitLabel;
  int? updated;
  dynamic url;
  List<Prices>? prices;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    map['active'] = active;
    if (attributes != null) {
      map['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    map['created'] = created;
    map['default_price'] = defaultPrice;
    map['description'] = description;
    if (features != null) {
      map['features'] = features?.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['livemode'] = livemode;
    map['metadata'] = metadata;
    map['name'] = name;
    map['package_dimensions'] = packageDimensions;
    map['shippable'] = shippable;
    map['statement_descriptor'] = statementDescriptor;
    map['tax_code'] = taxCode;
    map['type'] = type;
    map['unit_label'] = unitLabel;
    map['updated'] = updated;
    map['url'] = url;
    if (prices != null) {
      map['prices'] = prices?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'Product{id: $id, object: $object, active: $active,'
        ' attributes: $attributes, created: $created, '
        'defaultPrice: $defaultPrice, description: $description, '
        'features: $features, images: $images, livemode: $livemode, '
        'metadata: $metadata, name: $name, '
        'packageDimensions: $packageDimensions, shippable: $shippable, '
        'statementDescriptor: $statementDescriptor, taxCode: $taxCode, '
        'type: $type, unitLabel: $unitLabel, updated: $updated, '
        'url: $url, prices: $prices}';
  }
}

/// id : "price_1OSxxxxxxxxpEIXDKWeFGig4X"
/// object : "price"
/// active : true
/// billing_scheme : "per_unit"
/// created : 1703788386
/// currency : "usd"
/// custom_unit_amount : null
/// livemode : false
/// lookup_key : null
/// metadata : {}
/// nickname : null
/// product : "prod_PGwxxxxxxttRBgr"
/// recurring : null
/// tax_behavior : "unspecified"
/// tiers_mode : null
/// transform_quantity : null
/// type : "one_time"
/// unit_amount : 6357
/// unit_amount_decimal : "6357"

Prices pricesFromJson(String str) => Prices.fromJson(json.decode(str));
String pricesToJson(Prices data) => json.encode(data.toJson());

class Prices {
  Prices({
    this.id,
    this.object,
    this.active,
    this.billingScheme,
    this.created,
    this.currency,
    this.customUnitAmount,
    this.livemode,
    this.lookupKey,
    this.metadata,
    this.nickname,
    this.product,
    this.recurring,
    this.taxBehavior,
    this.tiersMode,
    this.transformQuantity,
    this.type,
    this.unitAmount,
    this.unitAmountDecimal,
  });

  Prices.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    billingScheme = json['billing_scheme'];
    created = json['created'];
    currency = json['currency'];
    customUnitAmount = json['custom_unit_amount'];
    livemode = json['livemode'];
    lookupKey = json['lookup_key'];
    metadata = json['metadata'];
    nickname = json['nickname'];
    product = json['product'];
    recurring = json['recurring'];
    taxBehavior = json['tax_behavior'];
    tiersMode = json['tiers_mode'];
    transformQuantity = json['transform_quantity'];
    type = json['type'];
    unitAmount = json['unit_amount'];
    unitAmountDecimal = json['unit_amount_decimal'];
  }
  String? id;
  String? object;
  bool? active;
  String? billingScheme;
  int? created;
  String? currency;
  dynamic customUnitAmount;
  bool? livemode;
  dynamic lookupKey;
  dynamic metadata;
  dynamic nickname;
  String? product;
  dynamic recurring;
  String? taxBehavior;
  dynamic tiersMode;
  dynamic transformQuantity;
  String? type;
  int? unitAmount;
  String? unitAmountDecimal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    map['active'] = active;
    map['billing_scheme'] = billingScheme;
    map['created'] = created;
    map['currency'] = currency;
    map['custom_unit_amount'] = customUnitAmount;
    map['livemode'] = livemode;
    map['lookup_key'] = lookupKey;
    map['metadata'] = metadata;
    map['nickname'] = nickname;
    map['product'] = product;
    map['recurring'] = recurring;
    map['tax_behavior'] = taxBehavior;
    map['tiers_mode'] = tiersMode;
    map['transform_quantity'] = transformQuantity;
    map['type'] = type;
    map['unit_amount'] = unitAmount;
    map['unit_amount_decimal'] = unitAmountDecimal;
    return map;
  }

  @override
  String toString() {
    return 'Prices{id: $id, object: $object, active: $active, '
        'billingScheme: $billingScheme, created: $created, '
        'currency: $currency, customUnitAmount: $customUnitAmount, '
        'livemode: $livemode, lookupKey: $lookupKey, metadata: $metadata, '
        'nickname: $nickname, product: $product, recurring: $recurring, '
        'taxBehavior: $taxBehavior, tiersMode: $tiersMode, '
        'transformQuantity: $transformQuantity, type: $type, '
        'unitAmount: $unitAmount, unitAmountDecimal: $unitAmountDecimal}';
  }
}
