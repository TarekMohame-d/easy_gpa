class CourseModel {
  final int? id;
  final String name;
  final String grade;
  final int credits;
  final int semester;

  CourseModel({
    required this.name,
    required this.grade,
    required this.credits,
    required this.semester,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final map = {
      'name': name,
      'grade': grade,
      'credits': credits,
      'semester': semester,
    };
    if (id != null) {
      map['id'] = id!;
    }
    return map;
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      name: map['name'],
      grade: map['grade'],
      credits: map['credits'],
      semester: map['semester'],
    );
  }
}
