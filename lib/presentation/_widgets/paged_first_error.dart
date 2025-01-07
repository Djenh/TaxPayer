import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';


class PagedFirstError extends StatelessWidget {
  const PagedFirstError({
    super.key,
    this.pagingController,
    required this.cxs,
  });

  final PagingController<dynamic, dynamic>? pagingController;
  final BoxConstraints? cxs;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: cxs,
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildText(context, "Une Erreur s'est produite lors du chargement", 16, Colors.black,
             fontWeight: FontWeight.w600, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text("${pagingController?.error}", textAlign: TextAlign.center),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              pagingController?.refresh();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            label: buildText(context, "Réessayer", 14, Colors.white,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}