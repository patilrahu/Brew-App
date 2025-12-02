import 'dart:convert';

List<BrewModel> brewModelFromJson(String str) =>
    List<BrewModel>.from(json.decode(str).map((x) => BrewModel.fromJson(x)));

String brewModelToJson(List<BrewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrewModel {
  String? id;
  String? name;
  String? breweryType;
  String? address1;
  dynamic address2;
  dynamic address3;
  String? city;
  String? stateProvince;
  String? postalCode;
  String? country;
  double? longitude;
  double? latitude;
  String? phone;
  String? websiteUrl;
  String? state;
  String? street;
  bool isFavourite;

  BrewModel({
    this.id,
    this.isFavourite = false,
    this.name,
    this.breweryType,
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.stateProvince,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,
    this.state,
    this.street,
  });
  BrewModel copyWith({
    String? id,
    String? name,
    String? breweryType,
    String? address1,
    dynamic address2,
    dynamic address3,
    String? city,
    String? stateProvince,
    String? postalCode,
    String? country,
    double? longitude,
    double? latitude,
    String? phone,
    String? websiteUrl,
    String? state,
    String? street,
    bool? isFavourite,
  }) {
    return BrewModel(
      id: id ?? this.id,
      name: name ?? this.name,
      breweryType: breweryType ?? this.breweryType,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      address3: address3 ?? this.address3,
      city: city ?? this.city,
      stateProvince: stateProvince ?? this.stateProvince,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      phone: phone ?? this.phone,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      state: state ?? this.state,
      street: street ?? this.street,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  factory BrewModel.fromJson(Map<String, dynamic> json) => BrewModel(
    id: json["id"],
    name: json["name"],
    breweryType: json["brewery_type"],
    address1: json["address_1"],
    address2: json["address_2"],
    address3: json["address_3"],
    city: json["city"],
    stateProvince: json["state_province"],
    postalCode: json["postal_code"],
    country: json["country"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    phone: json["phone"],
    websiteUrl: json["website_url"],
    state: json["state"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brewery_type": breweryType,
    "address_1": address1,
    "address_2": address2,
    "address_3": address3,
    "city": city,
    "state_province": stateProvince,
    "postal_code": postalCode,
    "country": country,
    "longitude": longitude,
    "latitude": latitude,
    "phone": phone,
    "website_url": websiteUrl,
    "state": state,
    "street": street,
  };
}
