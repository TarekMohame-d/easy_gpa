import 'package:easy_gpa/core/di/dependency_injection.dart';
import 'package:easy_gpa/core/routing/app_router.dart';
import 'package:easy_gpa/core/routing/routes.dart';
import 'package:easy_gpa/core/theme/app_themes.dart';
import 'package:easy_gpa/cubit/gpa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EasyGPA extends StatelessWidget {
  const EasyGPA(this.appRouter, {super.key});

  final AppRouter appRouter;

  Future<GpaCubit> _createCubit() async {
    final gpaCubit = GpaCubit(getIt(), getIt(), getIt());
    await gpaCubit.getAllCourses();
    return gpaCubit;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: FutureBuilder<GpaCubit>(
        future: _createCubit(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final gpaCubit = snapshot.data!;

          return BlocProvider.value(
            value: gpaCubit,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: AppThemes.lightTheme,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: Routes.homeScreen,
            ),
          );
        },
      ),
    );
  }
}
