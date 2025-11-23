import 'package:flutter/material.dart';
import 'package:kids_app_admin_panel/resources/textstyles.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';
import '../../data/model/stats_card_data.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<StatsCardData> stats = [
    StatsCardData(value: '205', label: "All Users"),
    StatsCardData(value: '122', label: "Total Verified Users"),
    StatsCardData(value: '150', label: "Total Un-Verified Users"),
    StatsCardData(value: '200', label: "Total Blogs Numbers"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(1.w),
            itemCount: stats.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              StatsCardData statsCardData = stats[index];
              return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: R.colors.greenGradient,
                  boxShadow: [
                    BoxShadow(
                      color: R.colors.black.withValues(alpha: 0.4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      statsCardData.label ?? "",
                      textAlign: TextAlign.center,
                      style: R.textStyles.poppins(
                        color: R.colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(35),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    Text(
                      statsCardData.value ?? "",
                      textAlign: TextAlign.center,
                      style: R.textStyles.poppins(
                        color: R.colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(25),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
