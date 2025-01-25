class GpsDto {
  double latitude;
  double longitude;

  GpsDto({required this.latitude, required this.longitude});

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
    return data;
  }

  factory GpsDto.fromJson(Map<String, dynamic> json) {
    return GpsDto(
        latitude: json['latitude'],
        longitude: json['longitude']
    );
  }

}


class AddressDto {

  String localityCode;
  String? description;
  GpsDto gps;


  AddressDto({required this.localityCode, this.description, required this.gps});

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = <String, dynamic>{
      'localityCode': localityCode,
      'gps': gps.toJson()
    };

    if(description != null) {
      data["description"] = description;
    }

    return data;
  }

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return AddressDto(
      localityCode: json['localityCode'],
      description: json['description'],
      gps: json['gps']
    );
  }
}

