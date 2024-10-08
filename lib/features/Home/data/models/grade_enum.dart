enum Grade {
  APlus,  // A+
  A,      // A
  AMinus, // A-
  BPlus,  // B+
  B,      // B
  BMinus, // B-
  CPlus,  // C+
  C,      // C
  CMinus, // C-
  DPlus,  // D+
  D,      // D
  F       // F (Fail)
}

extension GradeExtension on Grade {
  // Convert the enum to its string representation
  String get stringValue {
    switch (this) {
      case Grade.APlus:
        return 'A+';
      case Grade.A:
        return 'A';
      case Grade.AMinus:
        return 'A-';
      case Grade.BPlus:
        return 'B+';
      case Grade.B:
        return 'B';
      case Grade.BMinus:
        return 'B-';
      case Grade.CPlus:
        return 'C+';
      case Grade.C:
        return 'C';
      case Grade.CMinus:
        return 'C-';
      case Grade.DPlus:
        return 'D+';
      case Grade.D:
        return 'D';
      case Grade.F:
        return 'F';
    }
  }

  // Get the numeric value (GPA points)
  double get gpaValue {
    switch (this) {
      case Grade.APlus:
        return 4.0;
      case Grade.A:
        return 4.0;
      case Grade.AMinus:
        return 3.7;
      case Grade.BPlus:
        return 3.3;
      case Grade.B:
        return 3.0;
      case Grade.BMinus:
        return 2.7;
      case Grade.CPlus:
        return 2.3;
      case Grade.C:
        return 2.0;
      case Grade.CMinus:
        return 1.7;
      case Grade.DPlus:
        return 1.3;
      case Grade.D:
        return 1.0;
      case Grade.F:
        return 0.0;
    }
  }
}
