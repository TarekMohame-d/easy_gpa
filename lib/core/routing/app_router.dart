import 'package:easy_gpa/features/Home/presentation/screens/home_screen.dart';
import 'package:easy_gpa/features/courses/presentation/screens/courses_screen.dart';
import 'package:easy_gpa/features/semesters/presentation/screens/semesters_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class KAppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this => arguments as ClassName
    final arguments = settings.arguments;

    switch (settings.name) {
      case KRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case KRoutes.semestersScreen:
        return MaterialPageRoute(
          builder: (context) => const SemestersScreen(),
        );
      case KRoutes.coursesScreen:
        return MaterialPageRoute(
          builder: (context) => CoursesScreen(
            semesterNumber: arguments as int,
          ),
        );
      default:
        return null;
    }
  }
}
