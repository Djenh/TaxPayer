import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:invoice_app/presentation/_widgets/build_text.dart';

class PagedNewPageError extends StatelessWidget {
  const PagedNewPageError({
    super.key,
    this.pagingController,
  });

  final PagingController<dynamic, dynamic>? pagingController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText(context, "Une Erreur s'est produite lors du chargement", 16, Colors.black,
                fontWeight: FontWeight.w600, textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("${pagingController?.error}",
                  textAlign: TextAlign.center),
            ),
            ElevatedButton.icon(
              onPressed: () {
                pagingController?.retryLastFailedRequest();
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
      ),
    );
  }
}
