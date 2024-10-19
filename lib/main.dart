import 'package:easy_gpa/core/device/device_utility.dart';
import 'package:easy_gpa/core/service_locator/dependency_injection.dart';
import 'package:easy_gpa/core/helpers/bloc_observer.dart';
import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/core/routing/app_router.dart';
import 'package:easy_gpa/easy_gpa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  KDeviceUtility.setStatusBarColor();
  await SQLHelper.initDB();
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyGPA(
      AppRouter(),
    ),
  );
}
