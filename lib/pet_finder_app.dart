import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/core/theming/app_theme.dart';

import 'core/routing/app_router.dart';
import 'core/routing/router_observer.dart';

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        return MaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: AppRouter.generateRoute,
          navigatorObservers: [
            AppRouterObserver(),
          ],
        );
      },
    );
  }
}
