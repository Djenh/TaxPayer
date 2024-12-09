import 'package:flutter/material.dart';
import 'package:invoice_app/features/stocks/product/category/components/category_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text("Product Category"),
       ),
      body: const KCategoryList()

    );
  }
}
