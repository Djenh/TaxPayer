import 'package:invoice_app/domain/entities/company/pos_data_response.dart';
import 'package:invoice_app/domain/entities/customer/customer_list_response.dart';
import 'package:invoice_app/domain/entities/invoice/deposit_tax_response.dart';
import 'package:invoice_app/domain/entities/invoice/signature_entities.dart';
import 'package:invoice_app/domain/entities/invoice/tax_break_down_entities.dart';
import 'package:invoice_app/domain/entities/product/categories_entities.dart';
import 'package:invoice_app/domain/entities/product/pricing_response.dart';
import 'package:invoice_app/domain/entities/product/tax_group_response.dart';
import 'package:invoice_app/domain/entities/invoice/type_invoice_response.dart';
import 'package:json_annotation/json_annotation.dart';


part 'invoice_response.g.dart';


@JsonSerializable(explicitToJson: true)
class InvoiceResponse {

  InvoiceEntities? invoice;
  int? numberItems;
  String? totalInletters;
  SignatureEntities? signatureData;
  UnitData? total;
  List<TaxBreakDownEntities>? taxBreakDown;
  OriginalInvoice? originalInvoice;
  List<ReimbursementInvoices>? reimbursementInvoices;
  bool? fullyReimbursed;

  InvoiceResponse({this.invoice, this.numberItems, this.totalInletters,
    this.signatureData, this.total,  this.taxBreakDown, this.originalInvoice,
    this.reimbursementInvoices,this.fullyReimbursed});

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}


@JsonSerializable(explicitToJson: true)
class InvoiceEntities {

  String? id;
  String? tin;
  String? code;
  String? posCode;
  PosDataResponse? pos;
  CustomerEntities? client;
  TypeInvoiceEntities? typeInvoice;
  DepositTaxEntities? securityTax;
  String? clientCode;
  List<ItemsEntities>? items;
  String? comment;

  InvoiceEntities({this.id, this.tin, this.code, this.posCode, this.typeInvoice,
    this.securityTax,this.pos, this.client, this.clientCode, this.items, this.comment});

  factory InvoiceEntities.fromJson(Map<String, dynamic> json) =>
      _$InvoiceEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceEntitiesToJson(this);
}


@JsonSerializable(explicitToJson: true)
class ItemsEntities {

  ItemEntities? item;
  UnitData? unit;
  UnitData? total;

  ItemsEntities({this.item, this.unit, this.total});

  factory ItemsEntities.fromJson(Map<String, dynamic> json) =>
      _$ItemsEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsEntitiesToJson(this);
}


@JsonSerializable(explicitToJson: true)
class ItemEntities {

  String? id;
  TaxGroupEntities? taxGroup;
  String? comment;
  int? quantity;
  ProductInvoice? product;
  UnitData? total;
  String? priceDefinitionMode;
  num? taxSpecific;

  ItemEntities({this.id, this.taxGroup, this.comment, this.quantity, this.total,
    this.product, this.priceDefinitionMode, this.taxSpecific});

  factory ItemEntities.fromJson(Map<String, dynamic> json) =>
      _$ItemEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemEntitiesToJson(this);
}


@JsonSerializable(explicitToJson: true)
class ProductInvoice {

  String? id;
  String? code;
  String? name;
  String? officialProductNo;
  PriceData? price;
  CategoriesEntities? category;
  String? productType;
  String? companyTin;
  String? posCode;


  ProductInvoice({this.id, this.code, this.name, this.officialProductNo,
    this.price, this.category, this.productType, this.companyTin, this.posCode});

  factory ProductInvoice.fromJson(Map<String, dynamic> json) =>
      _$ProductInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInvoiceToJson(this);
}




@JsonSerializable(explicitToJson: true)
class UnitData {

  num? ttc;
  num? baseTaxable;
  num? tax;
  num? specificTax;
  num? securityTaxTotal;

  UnitData({this.ttc, this.baseTaxable, this.tax, this.specificTax,
    this.securityTaxTotal});

  factory UnitData.fromJson(Map<String, dynamic> json) =>
      _$UnitDataFromJson(json);

  Map<String, dynamic> toJson() => _$UnitDataToJson(this);
}


@JsonSerializable(explicitToJson: true)
class PriceData {

  String? id;
  int? amount;
  TaxGroupEntities? taxGroup;
  int? taxSpecific;
  double? createdAt;
  double? updatedAt;
  String? priceDefinitionMode;
  SubTotalPriceProd? subTotal;
  bool? enabled;

  PriceData({this.id, this.amount, this.taxGroup, this.taxSpecific,
    this.createdAt, this.updatedAt, this.priceDefinitionMode, this.subTotal,
    this.enabled});

  factory PriceData.fromJson(Map<String, dynamic> json) =>
      _$PriceDataFromJson(json);

  Map<String, dynamic> toJson() => _$PriceDataToJson(this);
}


@JsonSerializable(explicitToJson: true)
class OriginalInvoice {

  String? code;
  String? signature;
  num? numberItems;
  String? certifiedDate;
  num? total;
  bool? fullyReimbursed;

  OriginalInvoice({this.code, this.signature, this.numberItems,
    this.certifiedDate, this.total, this.fullyReimbursed});

  factory OriginalInvoice.fromJson(Map<String, dynamic> json) =>
      _$OriginalInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$OriginalInvoiceToJson(this);
}


@JsonSerializable(explicitToJson: true)
class ReimbursementInvoices {

  String? code;
  String? signature;
  num? numberItems;
  String? certifiedDate;
  num? total;

  ReimbursementInvoices({this.code, this.signature, this.numberItems,
    this.certifiedDate, this.total});

  factory ReimbursementInvoices.fromJson(Map<String, dynamic> json) =>
      _$ReimbursementInvoicesFromJson(json);

  Map<String, dynamic> toJson() => _$ReimbursementInvoicesToJson(this);
}