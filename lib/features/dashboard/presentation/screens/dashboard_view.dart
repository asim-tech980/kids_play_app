import 'package:flutter/material.dart';
import 'package:kids_app_admin_panel/services/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';
import '../../../../resources/textstyles.dart';
import '../../data/model/stats_card_data.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<StatsCardData> stats = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStats();
  }

  Future<void> fetchStats() async {
    var data = await Services.getStats();
    setState(() {
      stats = [
        StatsCardData(
          value: data['totalUsers'].toString(),
          label: "Total Users",
        ),
        StatsCardData(
          value: data['verifiedUsers'].toString(),
          label: "Verified",
        ),
        StatsCardData(
          value: data['unverifiedUsers'].toString(),
          label: "Unverified",
        ),
        StatsCardData(
          value: data['totalBlogs'].toString(),
          label: "Total Blogs",
        ),
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ShaderMask(
                shaderCallback: (bounds) =>
                    LinearGradient(
                      colors: [R.colors.primaryColor2, R.colors.primaryColor],
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: Text(
                  "Stats & Analytics".toUpperCase(),
                  style: R.textStyles
                      .nunito(
                        fontWeight: FontWeight.w600,
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(25),
                      )
                      .copyWith(color: R.colors.white),
                ),
              ),
            ),
            SizedBox(height: 2.h),

            // Stats Grid
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: R.colors.primaryColor2,
                        color: R.colors.primaryColor,
                      ),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.all(1.w),
                      itemCount: stats.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.7,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        var stat = stats[index];
                        return Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: R.colors.greenGradient,
                            boxShadow: [
                              BoxShadow(
                                color: R.colors.black.withOpacity(0.4),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                stat.label ?? "",
                                textAlign: TextAlign.center,
                                style: R.textStyles.nunito(
                                  color: R.colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                      AdaptiveTextSize.getAdaptiveTextSize(35),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                stat.value ?? "",
                                textAlign: TextAlign.center,
                                style: R.textStyles.nunito(
                                  color: R.colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                      AdaptiveTextSize.getAdaptiveTextSize(30),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
