import 'package:invoice_app/domain/entities/sort_entities.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pageable.dart';


part 'type_invoice_response.g.dart';


@JsonSerializable(explicitToJson: true)
class TypeInvoiceResponse {

  List<TypeInvoiceEntities>? content;
  Pageable1? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  bool? first;
  int? size;
  int? number;
  SortEntities? sort;
  int? numberOfElements;
  bool? empty;


  TypeInvoiceResponse({this.content, this.pageable, this.last, this.totalPages,
    this.totalElements, this.first, this.size, this.number, this.sort,
    this.numberOfElements, this.empty});

  factory TypeInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInvoiceResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class TypeInvoiceEntities {

  String? id;
  String? code;
  String? name;
  String? allowedTypeForReimburementCode;
  String? impactOnRevenues;


  TypeInvoiceEntities({this.id, this.code, this.name,
    this.allowedTypeForReimburementCode, this.impactOnRevenues});

  factory TypeInvoiceEntities.fromJson(Map<String, dynamic> json) =>
      _$TypeInvoiceEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$TypeInvoiceEntitiesToJson(this);
}