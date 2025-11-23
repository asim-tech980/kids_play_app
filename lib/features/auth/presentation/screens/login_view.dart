import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../resources/resources.dart';
import '../../../../resources/textstyles.dart';
import '../../../../resources/validations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailTC = TextEditingController(text: "jawadAhmad@kindsapp.com");
  final passwordTC = TextEditingController(text: "12345@aA");
  bool showPass = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.fillColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(R.images.left_pattern, width: 38.w),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Image.asset(R.images.right_pattern, width: 38.w),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AdaptiveTextSize.getAdaptiveTextSize(20),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 35.w),
                child: Card(
                  elevation: 20,
                  color: R.colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: R.colors.black.withValues(alpha: .7),
                  child: Padding(
                    padding:
                        EdgeInsets.all(
                          AdaptiveTextSize.getAdaptiveTextSize(30),
                        ) +
                        EdgeInsets.symmetric(
                          horizontal: AdaptiveTextSize.getAdaptiveTextSize(10),
                        ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            R.images.appLogoImage,
                            height: AdaptiveTextSize.getAdaptiveTextSize(200),
                          ),
                          SizedBox(
                            height: AdaptiveTextSize.getAdaptiveTextSize(5),
                          ),
                          Text(
                            'Login to your Account',
                            style: R.textStyles.poppins(
                              fontSize: 21,
                              color: R.colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: AdaptiveTextSize.getAdaptiveTextSize(8),
                          ),
                          Text(
                            'Enter your Email & password for login',
                            style: R.textStyles.poppins(color: R.colors.black),
                          ),
                          SizedBox(
                            height: AdaptiveTextSize.getAdaptiveTextSize(18),
                          ),
                          TextFormField(
                            controller: emailTC,
                            style: R.textStyles.poppins(
                              color: R.colors.black,
                              fontSize: 13,
                            ),
                            decoration: R.decoration.fieldDecoration(
                              hintText: "Email Address",
                              hintFontSize: R.fontsizes.t7,
                              suffixIcon: Icon(
                                Icons.email,
                                color: R.colors.primaryColor2,
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: AppValidator.validateEmail,
                          ),
                          SizedBox(
                            height: AdaptiveTextSize.getAdaptiveTextSize(8),
                          ),
                          TextFormField(
                            controller: passwordTC,
                            style: R.textStyles.poppins(
                              color: R.colors.black,
                              fontSize: 13,
                            ),
                            obscureText: !showPass,
                            decoration: R.decoration.fieldDecoration(
                              hintText: "Password",
                              hintFontSize: R.fontsizes.t7,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showPass = !showPass;
                                  setState(() {});
                                },
                                icon: Icon(
                                  showPass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: R.colors.primaryColor2,
                                ),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: AppValidator.validateEmpty,
                          ),

                          SizedBox(
                            height: AdaptiveTextSize.getAdaptiveTextSize(12),
                          ),

                          SizedBox(
                            height: AdaptiveTextSize.getAdaptiveTextSize(35),
                          ),
                          SizedBox(
                            height: 42,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  context.go("/base");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: R.colors.primaryColor,
                              ),
                              child: Text(
                                "Login Now",
                                style: R.textStyles.poppins(
                                  fontSize:
                                      AdaptiveTextSize.getAdaptiveTextSize(12),
                                  color: R.colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AdaptiveTextSize.getAdaptiveTextSize(35),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
