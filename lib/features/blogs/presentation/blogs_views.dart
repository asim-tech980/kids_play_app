// import 'package:flutter/material.dart';
// import 'package:kids_app_admin_panel/services/services.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../../resources/resources.dart';
// import '../../../resources/textstyles.dart';
// import '../data/model/blogs_model.dart';
// import 'add_blogs_info.dart';
//
// class BlogsViews extends StatefulWidget {
//   const BlogsViews({Key? key}) : super(key: key);
//
//   @override
//   State<BlogsViews> createState() => _BlogsViewsState();
// }
//
// class _BlogsViewsState extends State<BlogsViews> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: R.colors.backgroundColor,
//       body: Padding(
//         padding: EdgeInsets.all(24.0),
//         child: StreamBuilder<List<BlogsModel>>(
//           stream: Services.getBlogs(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text("No blogs found."));
//             }
//
//             List<BlogsModel> blogs = snapshot.data!;
//
//             return GridView.builder(
//               itemCount: blogs.length + 1,
//               shrinkWrap: true,
//               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 50.h,
//                 childAspectRatio: 1.5,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//               ),
//               itemBuilder: (context, index) {
//                 if (index == blogs.length) {
//                   // Add Blog Card
//                   return InkWell(
//                     onTap: () => showDialog(
//                       context: context,
//                       builder: (context) => AddBlogsInfo(),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         gradient: R.colors.greenGradient,
//                         boxShadow: [
//                           BoxShadow(
//                             color: R.colors.black.withValues(alpha: 0.4),
//                             blurRadius: 10,
//                           ),
//                         ],
//                       ),
//                       child: Container(
//                         margin: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(22),
//                           color: R.colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: R.colors.black.withValues(alpha: 0.4),
//                               blurRadius: 10,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "+Add",
//                               textAlign: TextAlign.center,
//                               style: R.textStyles.poppins(
//                                 color: R.colors.primaryColor,
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: AdaptiveTextSize.getAdaptiveTextSize(
//                                   35,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 1.h),
//                             Text(
//                               "Add Your Blogs ....",
//                               textAlign: TextAlign.center,
//                               style: R.textStyles.poppins(
//                                 color: R.colors.primaryColor2,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: AdaptiveTextSize.getAdaptiveTextSize(
//                                   15,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 } else {
//                   // Blog Card
//                   BlogsModel blog = blogs[index];
//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       gradient: R.colors.greenGradient,
//                       boxShadow: [
//                         BoxShadow(
//                           color: R.colors.black.withValues(alpha: 0.4),
//                           blurRadius: 10,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           blog.title,
//                           textAlign: TextAlign.center,
//                           style: R.textStyles.poppins(
//                             color: R.colors.white,
//                             fontWeight: FontWeight.w700,
//                             fontSize: AdaptiveTextSize.getAdaptiveTextSize(25),
//                           ),
//                         ),
//                         SizedBox(height: 1.h),
//                         Text(
//                           blog.description,
//                           textAlign: TextAlign.center,
//                           style: R.textStyles.poppins(
//                             color: R.colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: AdaptiveTextSize.getAdaptiveTextSize(15),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kids_app_admin_panel/services/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';
import '../../../resources/textstyles.dart';
import '../data/model/blogs_model.dart';
import 'add_blogs_info.dart';

class BlogsViews extends StatefulWidget {
  const BlogsViews({Key? key}) : super(key: key);

  @override
  State<BlogsViews> createState() => _BlogsViewsState();
}

class _BlogsViewsState extends State<BlogsViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ShaderMask(
                shaderCallback: (bounds) =>
                    LinearGradient(
                      colors: [
                        R.colors.primaryColor2,
                        R.colors.primaryColor,
                      ], // 60% opacity on second color
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: Text(
                  "Blogs Records & Managements".toUpperCase(),
                  style: R.textStyles
                      .nunito(
                        fontWeight: FontWeight.w600,
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(25),
                      )
                      .copyWith(
                        color: R.colors.white,
                      ), // Use white as placeholder
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: StreamBuilder<List<BlogsModel>>(
                stream: Services.getBlogs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: R.colors.primaryColor2,
                        color: R.colors.primaryColor,
                      ),
                    );
                  }

                  List<BlogsModel> blogs = snapshot.data ?? [];

                  // If blogs are empty, show only the "Add Blog" card
                  if (blogs.isEmpty) {
                    return Center(
                      child: InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => AddBlogsInfo(),
                        ),
                        child: Container(
                          width: 30.w,
                          height: 25.h,
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
                              children: [
                                Text(
                                  "+Add",
                                  textAlign: TextAlign.center,
                                  style: R.textStyles.poppins(
                                    color: R.colors.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        AdaptiveTextSize.getAdaptiveTextSize(
                                          35,
                                        ),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Add Your Blogs ....",
                                  textAlign: TextAlign.center,
                                  style: R.textStyles.poppins(
                                    color: R.colors.primaryColor2,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        AdaptiveTextSize.getAdaptiveTextSize(
                                          15,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  // If blogs exist, show them in a grid
                  return GridView.builder(
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
                            width: 30.w,
                            height: 25.h,
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
                                    color: R.colors.black.withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "+Add",
                                    textAlign: TextAlign.center,
                                    style: R.textStyles.poppins(
                                      color: R.colors.primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          AdaptiveTextSize.getAdaptiveTextSize(
                                            35,
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "Add Your Blogs ....",
                                    textAlign: TextAlign.center,
                                    style: R.textStyles.poppins(
                                      color: R.colors.primaryColor2,
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          AdaptiveTextSize.getAdaptiveTextSize(
                                            15,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }

                      BlogsModel blog = blogs[index];

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
                          children: [
                            Text(
                              blog.title,
                              textAlign: TextAlign.center,
                              style: R.textStyles.nunito(
                                color: R.colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: AdaptiveTextSize.getAdaptiveTextSize(
                                  30,
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              blog.description,
                              textAlign: TextAlign.center,
                              style: R.textStyles.poppins(
                                color: R.colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: AdaptiveTextSize.getAdaptiveTextSize(
                                  15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
