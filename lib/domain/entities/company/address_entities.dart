import 'package:invoice_app/domain/entities/company/sector_entities.dart';
import 'package:json_annotation/json_annotation.dart';


part 'address_entities.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressEntities {

  SectorEntities? locality;
  String? description;
  GpsEntities? gps;


  AddressEntities({this.locality, this.description, this.gps});

  factory AddressEntities.fromJson(Map<String, dynamic> json) =>
      _$AddressEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AddressEntitiesToJson(this);
}


@JsonSerializable(explicitToJson: true)
class GpsEntities {

  double? latitude;
  double? longitude;


  GpsEntities({this.latitude, this.longitude});

  factory GpsEntities.fromJson(Map<String, dynamic> json) =>
      _$GpsEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$GpsEntitiesToJson(this);
}