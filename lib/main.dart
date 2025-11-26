import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kids_app_admin_panel/resources/resources.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'app_routes.dart';
import 'features/app/presentation/provider/base_vm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAIayErlMPaf5z-Jacd5cXmz-gT_WmXDzs",
      authDomain: "kids-play-app-7ff98.firebaseapp.com",
      projectId: "kids-play-app-7ff98",
      storageBucket: "kids-play-app-7ff98.firebasestorage.app",
      messagingSenderId: "162626425432",
      appId: "1:162626425432:web:575353523fe56abad1702d",
      measurementId: "G-TK3KLYXXYZ",
    ),
  );

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => BaseVm())],
      child: MyApp(),
    ),
  );
}

AppRouter appRouter = AppRouter();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1)),
              child: GetMaterialApp.router(
                title: "Kids Play Admin Panel",
                theme: ThemeData(
                  timePickerTheme: TimePickerThemeData(
                    backgroundColor: R.colors.offWhiteColor,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hourMinuteColor: R.colors.primaryColor2,
                    hourMinuteTextColor: WidgetStateColor.resolveWith(
                      (states) => R.colors.black,
                    ),
                  ),
                  primarySwatch: Colors.blue,
                  useMaterial3: true,
                  scaffoldBackgroundColor: R.colors.transparent,
                ),
                debugShowCheckedModeBanner: false,
                builder: BotToastInit(),
                navigatorObservers: [BotToastNavigatorObserver()],
                routeInformationParser: appRouter.router.routeInformationParser,
                routeInformationProvider:
                    appRouter.router.routeInformationProvider,
                routerDelegate: appRouter.router.routerDelegate,
              ),
            );
          },
        );
      },
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
