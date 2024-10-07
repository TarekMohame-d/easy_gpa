import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/routing/app_router.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EasyGPA extends StatelessWidget {
  const EasyGPA(this.appRouter, {super.key});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
