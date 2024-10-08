import 'package:easy_gpa/features/Home/data/models/grade_enum.dart';

class CourseModel {
  final int? id;
  final String name;
  final Grade grade;
  final int semester;

  CourseModel({
    required this.name,
    required this.grade,
    required this.semester,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'grade': grade.name,
      'semester': semester,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      name: map['name'],
      grade: Grade.values.firstWhere((e) => e.name == map['grade']),
      semester: map['semester'],
    );
  }
}
