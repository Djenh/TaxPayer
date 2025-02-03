// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    InvoiceResponse(
      invoice: json['invoice'] == null
          ? null
          : InvoiceEntities.fromJson(json['invoice'] as Map<String, dynamic>),
      numberItems: (json['numberItems'] as num?)?.toInt(),
      totalInletters: json['totalInletters'] as String?,
      signatureData: json['signatureData'] == null
          ? null
          : SignatureEntities.fromJson(
              json['signatureData'] as Map<String, dynamic>),
      total: json['total'] == null
          ? null
          : UnitData.fromJson(json['total'] as Map<String, dynamic>),
      taxBreakDown: (json['taxBreakDown'] as List<dynamic>?)
          ?.map((e) => TaxBreakDownEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalInvoice: json['originalInvoice'] == null
          ? null
          : OriginalInvoice.fromJson(
              json['originalInvoice'] as Map<String, dynamic>),
      reimbursementInvoices: (json['reimbursementInvoices'] as List<dynamic>?)
          ?.map(
              (e) => ReimbursementInvoices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceResponseToJson(InvoiceResponse instance) =>
    <String, dynamic>{
      'invoice': instance.invoice?.toJson(),
      'numberItems': instance.numberItems,
      'totalInletters': instance.totalInletters,
      'signatureData': instance.signatureData?.toJson(),
      'total': instance.total?.toJson(),
      'taxBreakDown': instance.taxBreakDown?.map((e) => e.toJson()).toList(),
      'originalInvoice': instance.originalInvoice?.toJson(),
      'reimbursementInvoices':
          instance.reimbursementInvoices?.map((e) => e.toJson()).toList(),
    };

InvoiceEntities _$InvoiceEntitiesFromJson(Map<String, dynamic> json) =>
    InvoiceEntities(
      id: json['id'] as String?,
      tin: json['tin'] as String?,
      code: json['code'] as String?,
      posCode: json['posCode'] as String?,
      typeInvoice: json['typeInvoice'] == null
          ? null
          : TypeInvoiceEntities.fromJson(
              json['typeInvoice'] as Map<String, dynamic>),
      securityTax: json['securityTax'] == null
          ? null
          : DepositTaxEntities.fromJson(
              json['securityTax'] as Map<String, dynamic>),
      pos: json['pos'] == null
          ? null
          : PosDataResponse.fromJson(json['pos'] as Map<String, dynamic>),
      client: json['client'] == null
          ? null
          : CustomerEntities.fromJson(json['client'] as Map<String, dynamic>),
      clientCode: json['clientCode'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemsEntities.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$InvoiceEntitiesToJson(InvoiceEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tin': instance.tin,
      'code': instance.code,
      'posCode': instance.posCode,
      'pos': instance.pos?.toJson(),
      'client': instance.client?.toJson(),
      'typeInvoice': instance.typeInvoice?.toJson(),
      'securityTax': instance.securityTax?.toJson(),
      'clientCode': instance.clientCode,
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'comment': instance.comment,
    };

ItemsEntities _$ItemsEntitiesFromJson(Map<String, dynamic> json) =>
    ItemsEntities(
      item: json['item'] == null
          ? null
          : ItemEntities.fromJson(json['item'] as Map<String, dynamic>),
      unit: json['unit'] == null
          ? null
          : UnitData.fromJson(json['unit'] as Map<String, dynamic>),
      total: json['total'] == null
          ? null
          : UnitData.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsEntitiesToJson(ItemsEntities instance) =>
    <String, dynamic>{
      'item': instance.item?.toJson(),
      'unit': instance.unit?.toJson(),
      'total': instance.total?.toJson(),
    };

ItemEntities _$ItemEntitiesFromJson(Map<String, dynamic> json) => ItemEntities(
      id: json['id'] as String?,
      taxGroup: json['taxGroup'] == null
          ? null
          : TaxGroupEntities.fromJson(json['taxGroup'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      total: json['total'] == null
          ? null
          : UnitData.fromJson(json['total'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : ProductInvoice.fromJson(json['product'] as Map<String, dynamic>),
      priceDefinitionMode: json['priceDefinitionMode'] as String?,
      taxSpecific: json['taxSpecific'] as num?,
    );

Map<String, dynamic> _$ItemEntitiesToJson(ItemEntities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taxGroup': instance.taxGroup?.toJson(),
      'comment': instance.comment,
      'quantity': instance.quantity,
      'product': instance.product?.toJson(),
      'total': instance.total?.toJson(),
      'priceDefinitionMode': instance.priceDefinitionMode,
      'taxSpecific': instance.taxSpecific,
    };

ProductInvoice _$ProductInvoiceFromJson(Map<String, dynamic> json) =>
    ProductInvoice(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      officialProductNo: json['officialProductNo'] as String?,
      price: json['price'] == null
          ? null
          : PriceData.fromJson(json['price'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoriesEntities.fromJson(
              json['category'] as Map<String, dynamic>),
      productType: json['productType'] as String?,
      companyTin: json['companyTin'] as String?,
      posCode: json['posCode'] as String?,
    );

Map<String, dynamic> _$ProductInvoiceToJson(ProductInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'officialProductNo': instance.officialProductNo,
      'price': instance.price?.toJson(),
      'category': instance.category?.toJson(),
      'productType': instance.productType,
      'companyTin': instance.companyTin,
      'posCode': instance.posCode,
    };

UnitData _$UnitDataFromJson(Map<String, dynamic> json) => UnitData(
      ttc: json['ttc'] as num?,
      baseTaxable: json['baseTaxable'] as num?,
      tax: json['tax'] as num?,
      specificTax: json['specificTax'] as num?,
      securityTaxTotal: json['securityTaxTotal'] as num?,
    );

Map<String, dynamic> _$UnitDataToJson(UnitData instance) => <String, dynamic>{
      'ttc': instance.ttc,
      'baseTaxable': instance.baseTaxable,
      'tax': instance.tax,
      'specificTax': instance.specificTax,
      'securityTaxTotal': instance.securityTaxTotal,
    };

PriceData _$PriceDataFromJson(Map<String, dynamic> json) => PriceData(
      id: json['id'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      taxGroup: json['taxGroup'] == null
          ? null
          : TaxGroupEntities.fromJson(json['taxGroup'] as Map<String, dynamic>),
      taxSpecific: (json['taxSpecific'] as num?)?.toInt(),
      createdAt: (json['createdAt'] as num?)?.toDouble(),
      updatedAt: (json['updatedAt'] as num?)?.toDouble(),
      priceDefinitionMode: json['priceDefinitionMode'] as String?,
      subTotal: json['subTotal'] == null
          ? null
          : SubTotalPriceProd.fromJson(
              json['subTotal'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$PriceDataToJson(PriceData instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'taxGroup': instance.taxGroup?.toJson(),
      'taxSpecific': instance.taxSpecific,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'priceDefinitionMode': instance.priceDefinitionMode,
      'subTotal': instance.subTotal?.toJson(),
      'enabled': instance.enabled,
    };

OriginalInvoice _$OriginalInvoiceFromJson(Map<String, dynamic> json) =>
    OriginalInvoice(
      code: json['code'] as String?,
      signature: json['signature'] as String?,
      numberItems: json['numberItems'] as num?,
      certifiedDate: json['certifiedDate'] as String?,
      total: json['total'] as num?,
      fullyReimbursed: json['fullyReimbursed'] as bool?,
    );

Map<String, dynamic> _$OriginalInvoiceToJson(OriginalInvoice instance) =>
    <String, dynamic>{
      'code': instance.code,
      'signature': instance.signature,
      'numberItems': instance.numberItems,
      'certifiedDate': instance.certifiedDate,
      'total': instance.total,
      'fullyReimbursed': instance.fullyReimbursed,
    };

ReimbursementInvoices _$ReimbursementInvoicesFromJson(
        Map<String, dynamic> json) =>
    ReimbursementInvoices(
      code: json['code'] as String?,
      signature: json['signature'] as String?,
      numberItems: json['numberItems'] as num?,
      certifiedDate: json['certifiedDate'] as String?,
      total: json['total'] as num?,
    );

Map<String, dynamic> _$ReimbursementInvoicesToJson(
        ReimbursementInvoices instance) =>
    <String, dynamic>{
      'code': instance.code,
      'signature': instance.signature,
      'numberItems': instance.numberItems,
      'certifiedDate': instance.certifiedDate,
      'total': instance.total,
    };
