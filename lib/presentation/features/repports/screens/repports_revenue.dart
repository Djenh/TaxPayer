import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/commons/ui/kcompanycard.dart';
import 'package:invoice_app/presentation/res/assets/app_assets.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';
import 'package:invoice_app/utils/custom_image_view.dart';


Widget buildRepportSection({String? title, List<String>? items}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: KStyles.blackColor),
      ),
      const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: KStyles.dropDownBorderColor)
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            children: items!.map((item) => _buildRepportItemCard(title: item,date: "1 2020 1010 2890 2020")).toList(),
          ),
        ),
      ),
    ],
  );
}

Widget _buildRepportItemCard({String? title,date,VoidCallback? onTapItem,onTapXls,onTapPdf,onTapDocs}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      padding: const EdgeInsets.only(top: padding,bottom: padding),
      decoration: BoxDecoration(
        color: KStyles.bgContainerReppotsColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: KStyles.dropDownBorderColor)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: padding,right: padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                KComanyCard(
                  height: 40,
                  width: 40,
                  color: KStyles.cardGrey,
                  onPressed: (){

                  },
                  child: const Icon(Iconsax.courthouse,color: KStyles.primaryColor,size: 20),
                ),
                const SizedBox(
                  width: padding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: KStyles.blackColor)),
                    Text(date, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CustomImageView(
                  onTap: onTapXls,
                  height: 18,
                  width: 18,
                  imagePath: $appAssets.svgs.svxls,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                CustomImageView(
                  onTap: onTapPdf,
                  height: 18,
                  width: 18,
                  imagePath: $appAssets.svgs.svpdf,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                CustomImageView(
                  onTap: onTapDocs,
                  height: 20,
                  width: 20,
                  imagePath: $appAssets.svgs.svdocs,
                  fit: BoxFit.contain,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
