import 'package:easy_gpa/core/helpers/bloc_observer.dart';
import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/core/service_locator/dependency_injection.dart';
import 'package:easy_gpa/core/theme/theme.dart';
import 'package:easy_gpa/easy_gpa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  KAppTheme.setStatusBarColor();
  await SQLHelper.initDB();
  Bloc.observer = MyBlocObserver();

  FlutterNativeSplash.remove();

  runApp(
    EasyGPA(),
  );
}
