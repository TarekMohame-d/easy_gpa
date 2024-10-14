import 'dart:developer';
import 'dart:io';

import 'package:easy_gpa/features/Home/domain/repository/home_repo.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<bool> generateAndSavePdf(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  ) async {
    try {
      // Request storage permission and exit if not granted
      if (!await _requestPermission(Permission.storage)) {
        return false;
      }

      // Create PDF document
      final pdf = _buildPdf(courses, cGPA, allCreditHours);

      // Get the path to the Download folder
      final downloadPath = await _getDownloadPath();

      // Save the PDF file
      final file = File('$downloadPath/courses_report.pdf');
      await file.writeAsBytes(await pdf.save());

      return true;
    } catch (e) {
      log('Failed to generate or save PDF: $e');
      return false;
    }
  }

  // Method to build the PDF content
  pw.Document _buildPdf(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  ) {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) {
          return [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  'Courses Report',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(width: 20),
                pw.Text(
                  'CGPA: ${cGPA.toStringAsFixed(2)}',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
                pw.SizedBox(width: 10),
                pw.Text(
                  'Total Credit Hours: $allCreditHours',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
              ],
            ),
            pw.Divider(color: PdfColor.fromHex('#000000')),
            pw.ListView.separated(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return pw.Container(
                  margin: const pw.EdgeInsets.only(bottom: 10),
                  alignment: pw.Alignment.topLeft,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Name: ${course.name}',
                          style: const pw.TextStyle(fontSize: 14)),
                      pw.Text('Grade: ${course.grade}',
                          style: const pw.TextStyle(fontSize: 14)),
                      pw.Text('Credits: ${course.credits}',
                          style: const pw.TextStyle(fontSize: 14)),
                      pw.Text('Semester: ${course.semester}',
                          style: const pw.TextStyle(fontSize: 14)),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return pw.Divider(color: PdfColor.fromHex('#000000'));
              },
            ),
          ];
        },
      ),
    );

    return pdf;
  }

  // Method to get the download path
  Future<String> _getDownloadPath() async {
    final directory = Directory('/storage/emulated/0/Download');
    if (await directory.exists()) {
      return directory.path;
    }
    return (await getExternalStorageDirectory())!.path;
  }

  // Method to request permission with a return boolean result
  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      final result = await permission.request();
      if (result.isGranted) {
        return true;
      } else {
      }
    }
    return false;
  }
}
