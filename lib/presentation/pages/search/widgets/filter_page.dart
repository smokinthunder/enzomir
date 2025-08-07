import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterContent extends StatelessWidget {
  // Initial selections (should be managed externally in parent widget)
  final int selectedEventCategory = 0;
  final int selectedBudget = 3;
  final int selectedAttendees = 0;

  final List<String> eventCategories = [
    'All',
    'Music',
    'Dance',
    'Food & drinks',
    'Wedding',
  ];
  final List<String> budgetRanges = [
    '<1,500',
    '1,500 – 7,000',
    '7,000–15,000',
    '>15,000',
  ];
  final List<String> attendeeCounts = ['<1,000', '1,000–10,000', '>10,000'];

  FilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text("Filter", style: AppTextStyles.getStartedHeading),
            ),
          ),
          _buildSection(
            title: 'Event Category',
            items: eventCategories,
            selectedIndex: selectedEventCategory,
            isHorizontal: false,
          ),
          SizedBox(height: 16),
          _buildSection(
            title: 'Budget Range',
            items: budgetRanges,
            selectedIndex: selectedBudget,
            isHorizontal: false,
          ),
          SizedBox(height: 16),
          _buildSection(
            title: 'Number Of Attendees',
            items: attendeeCounts,
            selectedIndex: selectedAttendees,
            isHorizontal: false,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    borderRadius: BorderRadius.circular(12),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 3,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'RESET',
                      style: AppTextStyles.getstartedbtn2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.whiteButtonTextColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 3,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'APPLY',
                      style: AppTextStyles.getstartedbtn,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(20),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> items,
    required int selectedIndex,
    required bool isHorizontal,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.exploreCardTitle),
        SizedBox(height: 12),
        isHorizontal
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildButtons(items, selectedIndex),
            )
            : SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 8,
                runSpacing: 8,
                children: _buildButtons(items, selectedIndex),
              ),
            ),
      ],
    );
  }

  List<Widget> _buildButtons(List<String> items, int selectedIndex) {
    return items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      return FilterButton(text: item, isSelected: index == selectedIndex);
    }).toList();
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterButton({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: null, // Disabled - handled by parent
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: isSelected ? Colors.blue : Colors.white,
    //     foregroundColor: isSelected ? Colors.white : Colors.blue,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(22),
    //       side: BorderSide(color: Colors.blue, width: 2),
    //     ),
    //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //   ),
    //   child: Text(text),
    // );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: Text(
        text,
        style: AppTextStyles.recomendedCard.copyWith(
          color: isSelected ? Colors.white : AppColors.primary,
        ),
      ),
    );
  }
}
