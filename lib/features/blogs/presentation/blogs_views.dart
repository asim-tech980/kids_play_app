import 'package:flutter/material.dart';
import 'package:kids_app_admin_panel/resources/textstyles.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';
import '../data/model/blogs_model.dart';
import 'add_blogs_info.dart';

class BlogsViews extends StatefulWidget {
  BlogsViews({Key? key}) : super(key: key);

  @override
  State<BlogsViews> createState() => _BlogsViewsState();
}

class _BlogsViewsState extends State<BlogsViews> {
  List<BlogsModel> blogs = [
    BlogsModel(title: "Hello World", description: "How are you?"),
    BlogsModel(
      title: "Good Learning",
      description: "Learning is the best for Future",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: GridView.builder(
          itemCount: blogs.length + 1,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 50.h,
            childAspectRatio: 1.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            if (index == blogs.length) {
              return InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AddBlogsInfo(),
                ),
                child: Container(
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
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: R.colors.white,
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
                          "+Add",
                          textAlign: TextAlign.center,
                          style: R.textStyles.poppins(
                            color: R.colors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: AdaptiveTextSize.getAdaptiveTextSize(35),
                          ),
                        ),
                        SizedBox(height: 1.h),

                        Text(
                          "Add Your Blogs ....",
                          textAlign: TextAlign.center,
                          style: R.textStyles.poppins(
                            color: R.colors.primaryColor2,
                            fontWeight: FontWeight.w600,
                            fontSize: AdaptiveTextSize.getAdaptiveTextSize(15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              BlogsModel blogsModel = blogs[index];
              return Container(
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
                      blogsModel.title,
                      textAlign: TextAlign.center,
                      style: R.textStyles.poppins(
                        color: R.colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(25),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    Text(
                      blogsModel.description,
                      textAlign: TextAlign.center,
                      style: R.textStyles.poppins(
                        color: R.colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(15),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
