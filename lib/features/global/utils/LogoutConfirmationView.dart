import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kids_app_admin_panel/resources/textstyles.dart';

import '../../../resources/resources.dart';

class LogoutConfirmationView extends StatelessWidget {
  const LogoutConfirmationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      alignment: Alignment.center,
      backgroundColor: R.colors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 300,
        constraints: BoxConstraints(maxWidth: 300),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: R.colors.white,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            Icon(Icons.logout, size: 40, color: R.colors.primaryColor),
            const SizedBox(height: 20),
            // heading
            Text(
              'Logout Confirmation',
              textAlign: TextAlign.center,
              style: R.textStyles.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            const SizedBox(height: 4),
            // description
            Text(
              "Are your sure you want to logout?",
              style: R.textStyles.poppins(color: R.colors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
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
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(12),
                        fontWeight: FontWeight.w600,
                        color: R.colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/LoginView');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        R.colors.primaryColor,
                      ),
                    ),
                    child: Text(
                      'LogOut',
                      style: R.textStyles.poppins(
                        fontSize: AdaptiveTextSize.getAdaptiveTextSize(12),
                        fontWeight: FontWeight.w600,
                        color: R.colors.black,
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
