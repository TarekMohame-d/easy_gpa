import 'package:easy_gpa/core/di/dependency_injection.dart';
import 'package:easy_gpa/core/helpers/bloc_observer.dart';
import 'package:easy_gpa/core/helpers/constants.dart';
import 'package:easy_gpa/core/helpers/shared_pref_helper.dart';
import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/core/routing/app_router.dart';
import 'package:easy_gpa/core/theme/app_themes.dart';
import 'package:easy_gpa/easy_gpa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  AppThemes.setSystemUIColor();
  await SQLHelper.initDB();
  numOfSemesters =
      await SharedPrefHelper.getInt(SharedPrefKeys.numberOfSemesters);
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyGPA(
      AppRouter(),
    ),
  );
}
