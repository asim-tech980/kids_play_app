import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kids_app_admin_panel/resources/textstyles.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/resources.dart';
import '../../../resources/validations.dart';

class AddBlogsInfo extends StatefulWidget {
  const AddBlogsInfo({super.key});

  @override
  State<AddBlogsInfo> createState() => _AddBlogsInfoState();
}

class _AddBlogsInfoState extends State<AddBlogsInfo> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      alignment: Alignment.center,
      backgroundColor: R.colors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 50.w,
        constraints: BoxConstraints(maxWidth: 50.w),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: R.colors.white,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            Image.asset(R.images.appLogoImage, height: 140, width: 140),
            // heading
            Text(
              'Blog Information',
              textAlign: TextAlign.center,
              style: R.textStyles.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // description
            TextFormField(
              controller: titleController,
              style: R.textStyles.poppins(color: R.colors.black, fontSize: 13),
              decoration: R.decoration.fieldDecoration(
                hintText: "Enter the title of your blog",
                hintFontSize: R.fontsizes.t7,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: AppValidator.validateEmpty,
            ),
            const SizedBox(height: 12),
            // description
            TextFormField(
              controller: descriptionController,
              style: R.textStyles.poppins(color: R.colors.black, fontSize: 13),
              minLines: 5,
              maxLines: 8,
              decoration: R.decoration.fieldDecoration(
                hintText: "Enter the description of your blog",
                hintFontSize: R.fontsizes.t7,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: AppValidator.validateEmpty,
            ),
            const SizedBox(height: 18),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 43,
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          R.colors.primaryColor2,
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: R.textStyles.poppins(
                          fontSize: AdaptiveTextSize.getAdaptiveTextSize(16),
                          fontWeight: FontWeight.w600,
                          color: R.colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 43,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          R.colors.primaryColor,
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: R.textStyles.poppins(
                          fontSize: AdaptiveTextSize.getAdaptiveTextSize(16),
                          fontWeight: FontWeight.w600,
                          color: R.colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
