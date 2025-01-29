import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invoice_app/core/configs/injection_container.dart';
import 'package:invoice_app/core/services/toast_service.dart';
import 'package:invoice_app/domain/entities/company/localities_list_response.dart';
import 'package:invoice_app/presentation/controllers/company_ctrl.dart';
import 'package:invoice_app/presentation/res/app_input_styles.dart';

class LocalitiesPaginatedSearchableDropdown extends StatefulWidget {
  const LocalitiesPaginatedSearchableDropdown({super.key});

  @override
  State<LocalitiesPaginatedSearchableDropdown> createState() => _LocalitiesPaginatedSearchableDropdownState();
}

class _LocalitiesPaginatedSearchableDropdownState extends State<LocalitiesPaginatedSearchableDropdown> {

  final companyCtr = locator<CompanyCtrl>();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  int _pageKey = 0;
  final List<LocalitiesEntities> _allLocalities = [];
  List<LocalitiesEntities> _filteredLocalities = [];
  bool _isLoading = false;
  LocalitiesEntities? _selectedLocality;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _fetchLocalities();
  }


  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }


  void _loadMore() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      setState(() {
        _pageKey++;
        _isLoading = true;
      });
      _fetchLocalities();
    }
  }


  Future<void> _fetchLocalities() async {
    try {
      await companyCtr.allLocalitiesData(_pageKey);
      setState(() {
        _allLocalities.addAll(companyCtr.allLocalities);
        _filteredLocalities = _allLocalities;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });

      if(!mounted) return;
      ToastService.showError(context,
          "Impossible de charger les localités : $error");
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredLocalities = _allLocalities
          .where((locality) =>
      locality.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Iconsax.close_square)
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: _searchController,
            textInputAction: TextInputAction.search,
            decoration: AppInputStyles.defaultInputDecoration(
              labelText: "Rechercher une localité",
              suffixIcon: const Icon(Iconsax.search_normal)
            ),
            onChanged: _onSearchChanged,
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _filteredLocalities.length + (_isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _filteredLocalities.length) {
                return const Center(child: CircularProgressIndicator());
              }
              final locality = _filteredLocalities[index];
              return ListTile(
                title: Text(locality.name ?? "Nom inconnu"),
                subtitle: locality.code != null ? Text(locality.code!) : null,
                onTap: () {
                  setState(() {
                    _selectedLocality = locality;
                  });
                  Get.back(result: locality);
                },
              );
            },
          ),
        ),
      ],
    );
  }



}


