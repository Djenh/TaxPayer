import 'package:json_annotation/json_annotation.dart';


part 'file_data_response.g.dart';


@JsonSerializable(explicitToJson: true)
class FileDataResponse {

  String? status;
  int? code;
  String? message;
  String? info;
  String? reference;
  int? id;
  String? path;
  FileEntities? data;

  FileDataResponse({this.status, this.code, this.message, this.info,
      this.reference, this.id, this.path, this.data});

  factory FileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FileDataResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class FileEntities {

  String? name;
  String? path;
  String? type;
  String? contentType;
  String? url;
  String? version;

  FileEntities({this.name, this.path, this.type, this.contentType, this.url,
        this.version});

  factory FileEntities.fromJson(Map<String, dynamic> json) =>
      _$FileEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$FileEntitiesToJson(this);
}