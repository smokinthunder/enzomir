import 'package:enzomir/core/theme/text_styles.dart';
import 'package:enzomir/presentation/pages/search/widgets/custom_search_bar.dart';
import 'package:enzomir/presentation/pages/search/widgets/filter_pop.dart';
import 'package:enzomir/presentation/pages/search/widgets/filter_page.dart';
import 'package:enzomir/presentation/pages/search/widgets/search_result_card.dart';
import 'package:enzomir/presentation/pages/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button and title
            CustomAppBar(title: "Search"),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(child: CustomSearchBar()),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return FilterContent();
                        },
                      );
                    },
                    child: FilterPop(),
                  ),
                ],
              ),
            ),

            // Search results header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search results', style: AppTextStyles.searchDetails1),
                  Text('112 found', style: AppTextStyles.searchDetails2),
                ],
              ),
            ),

            // Search results list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const SearchResultCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
