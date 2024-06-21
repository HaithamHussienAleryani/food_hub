import 'dart:convert';

OfferModel offerModelFromJson(String str) =>
    OfferModel.fromJson(json.decode(str));
String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  OfferModel({
    String? image,
    String? restaurantRef,
  }) {
    _image = image;
    _restaurantRef = restaurantRef;
  }

  OfferModel.fromJson(dynamic json) {
    _image = json['image'];
    _restaurantRef = json['restaurantRef'];
  }
  String? _image;
  String? _restaurantRef;

  String? get image => _image;
  String? get restaurantRef => _restaurantRef;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['restaurantRef'] = _restaurantRef;
    return map;
  }
}
