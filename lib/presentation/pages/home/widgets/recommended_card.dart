import 'package:enzomir/core/theme/colors.dart';
import 'package:enzomir/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: 129,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),

      child: Stack(
        children: [
          Image.asset(
            "assets/images/home/recomended_for_you.png",
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withValues(alpha: 0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Weding", style: AppTextStyles.recomendedCard),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: AppColors.pureWhite,
                      size: 10,
                    ),
                    Text(
                      " Kochi, Kerala",
                      style: AppTextStyles.recomendedCard2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
