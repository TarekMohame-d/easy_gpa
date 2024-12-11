import 'package:easy_gpa/core/routing/app_router.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/service_locator/dependency_injection.dart';
import 'package:easy_gpa/core/theme/theme.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EasyGPA extends StatelessWidget {
  const EasyGPA({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => GpaCubit(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: KAppTheme.lightTheme,
          onGenerateRoute: KAppRouter().generateRoute,
          initialRoute: KRoutes.homeScreen,
        ),
      ),
    );
  }
}
