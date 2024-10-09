import 'package:easy_gpa/features/Home/presentation/screens/home_screen.dart';
import 'package:easy_gpa/features/semesters/presentation/screens/semesters_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this => arguments as ClassName
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
        case Routes.semestersScreen:
        return MaterialPageRoute(
          builder: (context) => const SemestersScreen(),
        );
      default:
        return null;
    }
  }
}
