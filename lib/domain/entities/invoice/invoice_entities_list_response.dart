import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/domain/entities/pageable.dart';
import 'package:invoice_app/domain/entities/sort_entities.dart';
import 'package:json_annotation/json_annotation.dart';


part 'invoice_entities_list_response.g.dart';


@JsonSerializable(explicitToJson: true)
class InvoiceEntitiesListResponse {

  List<InvoiceResponse>? content;
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


  InvoiceEntitiesListResponse({this.content, this.pageable, this.last, this.totalPages,
    this.totalElements, this.first, this.size, this.number, this.sort,
    this.numberOfElements, this.empty});

  factory InvoiceEntitiesListResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceEntitiesListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceEntitiesListResponseToJson(this);
}