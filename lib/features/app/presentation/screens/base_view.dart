import 'package:flutter/material.dart';
import 'package:kids_app_admin_panel/features/blogs/presentation/blogs_views.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';
import '../../../dashboard/presentation/screens/dashboard_view.dart';
import '../../../global/responsive_widgets.dart';
import '../../../users_list/presentation/screens/users_list_view.dart';
import '../provider/base_vm.dart';
import '../widgets/side_bar_widgets.dart';

class BaseView extends StatefulWidget {
  static String route = '/BaseView';
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(seconds: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVm>(
      builder: (context, baseVm, child) {
        return Scaffold(
          backgroundColor: R.colors.backgroundColor,
          body: largeScreen(baseVm: baseVm),
        );
      },
    );
  }

  Widget largeScreen({required BaseVm baseVm}) {
    return Padding(
      padding: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: const SideBarWidget()),
          SizedBox(width: 10),
          Expanded(
            flex: 11,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.sp),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 18,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0.sp),
                            child: PageView(
                              controller: baseVm.pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                DashboardScreen(),
                                UsersListView(),
                                BlogsViews(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
