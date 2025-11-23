import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../resources/resources.dart';
import '../../../../resources/textstyles.dart';
import '../../../global/responsive_widgets.dart';
import '../../../global/utils/LogoutConfirmationView.dart';
import '../provider/base_vm.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({Key? key}) : super(key: key);

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  ScrollController scrollController = ScrollController();

  List<String> tabTextList = ["Dashboard", "Users", "Blogs", "Logout"];

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVm>(
      builder: (context, baseVm, child) {
        return ResponsiveWidget.isLargeScreen(context)
            ? largeWidget(baseVm: baseVm)
            : ResponsiveWidget.isMediumScreen(context)
            ? largeWidget(baseVm: baseVm)
            : smallWidget(baseVm: baseVm);
      },
    );
  }

  Widget largeWidget({required BaseVm baseVm}) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: R.colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  R.images.appLogoImage,
                  width: AdaptiveTextSize.getAdaptiveTextSize(100),
                ),
                SizedBox(height: 6),
                ShaderMask(
                  shaderCallback: (bounds) =>
                      LinearGradient(
                        colors: [
                          R.colors.primaryColor,
                          R.colors.primaryColor2,
                        ], // 60% opacity on second color
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: Text(
                    "Admin Panel".toUpperCase(),
                    style: R.textStyles
                        .nunito(fontWeight: FontWeight.w600, fontSize: 10)
                        .copyWith(
                          color: R.colors.white,
                        ), // Use white as placeholder
                  ),
                ),
              ],
            ),
          ),
          sideBarContainer(
            indexCount: 0,
            title: tabTextList[0],
            baseVm: baseVm,
          ),
          sideBarContainer(
            indexCount: 1,
            title: tabTextList[1],
            baseVm: baseVm,
          ),
          sideBarContainer(
            indexCount: 2,
            title: tabTextList[2],
            baseVm: baseVm,
          ),

          Spacer(),

          logoutButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget smallWidget({required BaseVm baseVm}) {
    return Container(
      color: R.colors.white,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: RawScrollbar(
                thickness: 2,
                thumbColor: R.colors.lightBlueColor,
                radius: const Radius.circular(5),
                thumbVisibility: false,
                controller: scrollController,
                scrollbarOrientation: ScrollbarOrientation.right,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(scrollbars: false),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(R.images.appLogoImage, width: 40),
                      ),
                      smallSideBarContainer(
                        indexCount: 0,

                        title: tabTextList[0],
                        baseVm: baseVm,
                      ),
                      smallSideBarContainer(
                        indexCount: 1,

                        title: tabTextList[1],
                        baseVm: baseVm,
                      ),
                      smallSideBarContainer(
                        indexCount: 2,

                        title: tabTextList[2],
                        baseVm: baseVm,
                      ),
                      smallSideBarContainer(
                        indexCount: 3,

                        title: tabTextList[3],
                        baseVm: baseVm,
                      ),
                      smallSideBarContainer(
                        indexCount: 4,
                        title: tabTextList[4],
                        baseVm: baseVm,
                      ),
                      smallSideBarContainer(
                        indexCount: 5,
                        title: tabTextList[5],
                        baseVm: baseVm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sideBarContainer({
    IconData? icon,
    bool? isIcon = false,
    required String title,
    required int indexCount,
    required BaseVm baseVm,
  }) {
    return SizedBox(
      height: 35,

      child: Row(
        children: [
          Container(
            width: 5,
            // height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
              gradient: baseVm.selectedIndex == indexCount
                  ? R.colors.greenGradient
                  : null,
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                baseVm.selectedIndex = indexCount;

                if (baseVm.selectedIndex == -1) {
                  showDialog(
                    context: context,
                    builder: (context) => LogoutConfirmationView(),
                  );
                } else {
                  baseVm.pageController.jumpToPage(indexCount);
                }

                baseVm.update();

                // context.read<UserVM>().onTapDefault();
                // }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 7),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: baseVm.selectedIndex == indexCount
                      ? R.colors.greenGradient
                      : null,
                ),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: R.textStyles.poppins(
                    color: baseVm.selectedIndex == indexCount
                        ? R.colors.white
                        : R.colors.lightGreyColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget logoutButton() {
    return Row(
      children: [
        Container(
          width: 5,
          // height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
            color: R.colors.white,
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => LogoutConfirmationView(),
              );
            },
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 7),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: R.colors.white,
              ),
              child: Text(
                "Logout",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: R.textStyles.poppins(
                  color: R.colors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget smallSideBarContainer({
    IconData? icon,
    bool? isIcon = false,
    required String title,
    required int indexCount,
    required BaseVm baseVm,
  }) {
    return InkWell(
      onTap: () {
        if (!isDisabled(indexCount)) {
          baseVm.selectedIndex = indexCount;
          baseVm.pageController.jumpToPage(indexCount);
          // context.read<UserVM>().onTapDefault();
          baseVm.update();
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: baseVm.selectedIndex == indexCount
              ? R.colors.greenGradient
              : null,
        ),
        child: Center(
          child: Text(
            title[0].toUpperCase(),
            style: R.textStyles.poppins(
              color: baseVm.selectedIndex == indexCount
                  ? R.colors.white
                  : R.colors.lightGreyColor,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  bool isDisabled(int index) {
    return (index == 8 || index == 9);
  }
}
