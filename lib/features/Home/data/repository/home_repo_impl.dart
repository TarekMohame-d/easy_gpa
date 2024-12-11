import 'dart:developer';
import 'dart:io';

import 'package:easy_gpa/core/device/device_info_helper.dart';
import 'package:easy_gpa/features/Home/data/data_sources/home_data_source.dart';
import 'package:easy_gpa/features/Home/domain/repository/home_repo.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepoImpl(this._homeDataSource);

  @override
  Future<bool> generateAndSavePdf(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  ) async {
    try {
      // Request storage permission and exit if not granted
      if (!await _requestStoragePermission()) {
        return false;
      }

      // Create PDF document
      final pdf = await _buildPdf(courses, cGPA, allCreditHours);

      final path = await _getDirectoryPath();

      // Save the PDF file
      final file = File('$path/courses_report.pdf');
      await file.writeAsBytes(await pdf.save());

      return true;
    } catch (e) {
      log('Failed to generate or save PDF: $e');
      return false;
    }
  }

  // Method to build the PDF content
  Future<pw.Document> _buildPdf(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  ) async {
    final font = await rootBundle.load("assets/fonts/Poppins-Regular.ttf");
    final ttf = Font.ttf(font);
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
                    font: ttf,
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(width: 20),
                pw.Text(
                  'CGPA: ${cGPA.toStringAsFixed(2)}',
                  style: pw.TextStyle(
                    font: ttf,
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                  ),
                ),
                pw.SizedBox(width: 10),
                pw.Text(
                  'Total Credit Hours: $allCreditHours',
                  style: pw.TextStyle(
                    font: ttf,
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
                          style: pw.TextStyle(
                            font: ttf,
                            fontSize: 14,
                          )),
                      pw.Text('Grade: ${course.grade}',
                          style: pw.TextStyle(font: ttf, fontSize: 14)),
                      pw.Text('Credits: ${course.credits}',
                          style: pw.TextStyle(font: ttf, fontSize: 14)),
                      pw.Text('Semester: ${course.semester}',
                          style: pw.TextStyle(font: ttf, fontSize: 14)),
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

  // Method to get the directory path
  Future<String> _getDirectoryPath() async {
    final directory = Directory('/storage/emulated/0/Download');
    if (await directory.exists()) {
      return directory.path;
    }
    return (await getExternalStorageDirectory())!.path;
  }

  // Method to request storage permission with a return boolean result
  Future<bool> _requestStoragePermission() async {
    final deviceInfo = await KDeviceInfoHelper.getAndroidDeviceInfo();
    Permission permission;

    if (deviceInfo.version.sdkInt > 32) {
      permission = Permission.manageExternalStorage;
    } else {
      permission = Permission.storage;
    }

    var status = await permission.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      status = await permission.request();
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      status = await permission.status;
    }

    return status.isGranted;
  }

  @override
  Future<List<CourseModel>> getAllCourses() async {
    List<Map<String, dynamic>> courses =
        await _homeDataSource.getAllCourses();
    List<CourseModel>? coursesList;
    if (courses.isNotEmpty) {
      coursesList = courses.map((e) => CourseModel.fromMap(e)).toList();
    }
    return coursesList ?? [];
  }
}
