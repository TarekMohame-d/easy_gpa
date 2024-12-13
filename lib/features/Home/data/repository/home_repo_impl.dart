import 'dart:developer';
import 'dart:io';

import 'package:easy_gpa/core/device/device_info_helper.dart';
import 'package:easy_gpa/core/helpers/repo_result.dart';
import 'package:easy_gpa/core/helpers/sql_helper.dart';
import 'package:easy_gpa/features/Home/domain/repository/home_repo.dart';
import 'package:easy_gpa/features/courses/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<RepoResult<String>> generateAndSavePdf(
    List<CourseModel> courses,
    double cGPA,
    int allCreditHours,
  ) async {
    try {
      final path = await _getDirectoryPath();
      if (path.$1 == false) return RepoResult.failure(path.$2);

      // Create PDF document
      final pdf = await _buildPdf(courses, cGPA, allCreditHours);

      // Save the PDF file
      final file = File('${path.$2}/courses_report.pdf');
      await file.writeAsBytes(await pdf.save());

      return RepoResult.success(path.$2);
    } catch (e) {
      log('Failed to generate or save PDF: $e');
      return RepoResult.failure('Failed to generate PDF.');
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
  Future<(bool, String)> _getDirectoryPath() async {
    try {
      final result = await _requestStoragePermission();

      if (result.$1 == false) return (false, result.$2!);
      Directory? directory;

      if (Platform.isAndroid) {
        Directory? directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
          final downloadsDir = Directory('${directory!.path}/Download');
          if (!await downloadsDir.exists()) {
            await downloadsDir.create(recursive: true);
          }
          return (true, downloadsDir.path);
        } else {
          return (true, directory.path);
        }
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
        // Use Documents directory for iOS.
        return (true, directory.path);
      }
      throw Exception('Unable to determine platform-specific directory.');
    } catch (e) {
      debugPrint('Error getting directory path: $e');
      return (false, 'Unable to determine directory path.');
    }
  }

  // Method to request storage permission with a return boolean result
  Future<(bool, String?)> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      Permission permission;

      if (await _isAndroid12OrAbove()) {
        permission = Permission.manageExternalStorage;
      } else {
        permission = Permission.storage;
      }

      var status = await permission.status;

      if (status.isGranted) {
        return (true, null);
      } else {
        status = await permission.request();
      }

      if (status.isPermanentlyDenied) {
        await openAppSettings();
        status = await permission.status;
      }

      if (status.isGranted) {
        return (true, null);
      } else {
        return (false, 'Storage permission not granted.');
      }
    } else if (Platform.isIOS) {
      // Request permission to access media library (if needed)
      if (!await Permission.storage.isGranted) {
        final status = await Permission.storage.request();
        if (status != PermissionStatus.granted) {
          return (false, 'Storage permission not granted.');
        }
        return (true, null);
      }
      return (true, null);
    }
    return (false, 'Unknown platform.');
  }

  Future<bool> _isAndroid12OrAbove() async {
    final deviceInfo = await KDeviceInfoHelper.getAndroidDeviceInfo();
    return deviceInfo.version.sdkInt >= 31;
  }

  @override
  Future<RepoResult<List<CourseModel>>> getAllCourses() async {
    try {
      List<Map<String, dynamic>> courses = await SQLHelper.getAllDBItems();
      List<CourseModel>? coursesList;
      if (courses.isNotEmpty) {
        coursesList = courses.map((e) => CourseModel.fromMap(e)).toList();
      }
      return RepoResult.success(coursesList ?? []);
    } catch (e) {
      debugPrint('Error while getting all courses: $e');
      return RepoResult.failure('Error while getting all courses: $e');
    }
  }
}
