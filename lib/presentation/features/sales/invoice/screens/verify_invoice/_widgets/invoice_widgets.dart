import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/domain/entities/invoice/invoice_response.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/utils.dart';



Widget buildCompanyInfoCard(BuildContext context,bool isCustomer, String rcm, String nameUser,
    String email, String phone, String adr, String ifu) {
  return Container(
    padding: const EdgeInsets.all(8),
    width: MediaQuery.of(context).size.width / 2,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: KStyles.fieldGrey)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !isCustomer
            ? Container(
          padding: const EdgeInsets.all(6),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4)),
        )
            : const Icon(Iconsax.user_tag, color: Colors.black),
        const SizedBox(height: 8),
        buildText(context, rcm, 8, Colors.black, fontWeight: FontWeight.w300),
        const SizedBox(height: 4),
        buildText(context, nameUser, 10, Colors.black,
            fontWeight: FontWeight.w700),
        const SizedBox(height: 4),
        buildText(context, email, 8, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: 4),
        buildText(context, phone, 8, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: 4),
        buildText(context, adr, 8, Colors.black, fontWeight: FontWeight.w300),
        const SizedBox(height: 4),
        buildText(context, ifu, 8, Colors.black,
            fontWeight: FontWeight.w300),
        const SizedBox(height: 4),
      ],
    ),
  );
}


Widget buildReferenceCreditInvoice(BuildContext context,String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildText(context, title, 12, Colors.black,
          fontWeight: FontWeight.w400),
      const SizedBox(width: 10),
      Flexible(child: buildText(context, value, 12, Colors.black, fontWeight: FontWeight.w400))
    ],
  );
}

Widget buildTitleInvoice(BuildContext context,String title, String numberInvoice) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildText(context, title, 24, Colors.black,
          fontWeight: FontWeight.w700),
      const SizedBox(height: 4),
      buildText(context, numberInvoice, 14, Colors.black,
          fontWeight: FontWeight.w400)
    ],
  );
}

Widget buildItemArticle(BuildContext context,ItemsEntities itemsEntities) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: KStyles.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(4),
        child: buildText(
            context, itemsEntities.item?.product?.productType??"".toUpperCase(), 10, KStyles.primaryColor,
            fontWeight: FontWeight.w400),
      ),
      const SizedBox(height: 3),
      buildText(context, "${itemsEntities.item?.quantity??1} QTE x ${itemsEntities.item?.product?.price?.amount?.toString()??""}", 12, Colors.black,
          fontWeight: FontWeight.w500),
      const SizedBox(height: 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(context, "${itemsEntities.item?.product?.name??""}  [${itemsEntities.item?.product?.price?.taxGroup?.code??""}]", 12, Colors.black,
              fontWeight: FontWeight.w500),
          buildText(context, "*${Utils.getFormattedAmount(itemsEntities.total?.ttc!.toInt() as num)}", 12, Colors.black,
              fontWeight: FontWeight.w500),
        ],
      ),
      const SizedBox(height: 3),
      const DottedDashedLine(
          height: 0,
          width: double.infinity,
          axis: Axis.horizontal,
          strokeWidth: 0.5),
    ],
  );
}

Widget buildItemSifecArticle(BuildContext context,ItemsEntities itemsEntities) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: KStyles.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(4),
        child: buildText(
            context, itemsEntities.item?.typeProduct?.name??"".toUpperCase(), 10, KStyles.primaryColor,
            fontWeight: FontWeight.w400),
      ),
      const SizedBox(height: 3),
      buildText(context, "${itemsEntities.item?.quantity??1} QTE x ${itemsEntities.item?.price.toString()??""}", 12, Colors.black,
          fontWeight: FontWeight.w500),
      const SizedBox(height: 3),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(context, "${itemsEntities.item?.name??""}  [${itemsEntities.item?.taxGroup?.code??""}]", 12, Colors.black,
              fontWeight: FontWeight.w500),
          buildText(context, "*${Utils.getFormattedAmount(itemsEntities.total?.ttc!.toInt() as num)}", 12, Colors.black,
              fontWeight: FontWeight.w500),
        ],
      ),
      const SizedBox(height: 3),
      const DottedDashedLine(
          height: 0,
          width: double.infinity,
          axis: Axis.horizontal,
          strokeWidth: 0.5),
    ],
  );
}
/*
  Widget _buildItemArticle(ItemsEntities itemsEntities) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: KStyles.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(4),
          child: buildText(
              context, itemsEntities.item!.product!.code!, 10, KStyles.primaryColor,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 3),
        buildText(context, "${itemsEntities.item!.quantity??1} QTE x ${itemsEntities.item!.product?.price?.amount?.toString()??""} = ${itemsEntities.item!.product?.price?.subTotal?.ttc?.toString()??""}", 12, Colors.black,
            fontWeight: FontWeight.w500),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildText(context, "EAUX MINERALES  [E]", 12, Colors.black,
                fontWeight: FontWeight.w500),
            buildText(context, "*1.000", 12, Colors.black,
                fontWeight: FontWeight.w500),
          ],
        ),
        const SizedBox(height: 3),
        const DottedDashedLine(
            height: 0,
            width: double.infinity,
            axis: Axis.horizontal,
            strokeWidth: 0.5),
      ],
    );
  }
   */
Widget buildRecapArticle(BuildContext context,String title1, String value1, String title2, String value2) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(context, title1, 14, Colors.black,
              fontWeight: FontWeight.w500),
          buildText(context, value1, 14, Colors.black,
              fontWeight: FontWeight.w500),
        ],
      ),
      const SizedBox(height: 4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(context, title2, 12, Colors.black,
              fontWeight: FontWeight.w500),
          buildText(context, value2, 13, Colors.black,
              fontWeight: FontWeight.w500),
        ],
      ),
      const SizedBox(height: 3),
      const DottedDashedLine(
          height: 0,
          width: double.infinity,
          axis: Axis.horizontal,
          strokeWidth: 0.5),
    ],
  );
}

Widget buildRowDataSign(BuildContext context,String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildText(context, title, 8, Colors.black, fontWeight: FontWeight.w300),
      buildText(context, value, 8, Colors.black, fontWeight: FontWeight.w400),
    ],
  );
}