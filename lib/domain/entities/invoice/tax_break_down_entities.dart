import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:json_annotation/json_annotation.dart';


part 'tax_break_down_entities.g.dart';


@JsonSerializable(explicitToJson: true)
class TaxBreakDownEntities {

  TaxGroupEntities? taxGroup;
  num? tax;
  num? taxableBase;
  num? total;


  TaxBreakDownEntities({this.taxGroup, this.tax, this.taxableBase, this.total});

  factory TaxBreakDownEntities.fromJson(Map<String, dynamic> json) =>
      _$TaxBreakDownEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$TaxBreakDownEntitiesToJson(this);
}