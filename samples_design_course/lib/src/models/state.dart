import 'package:flutter/foundation.dart' as f;

import 'course.dart';

class MyAppState extends f.ChangeNotifier {
  final List<Course> categoryList;
  final List<Course> courseList;

  Course? selectedCourse;

  bool get isEmpty => categoryList.isEmpty && courseList.isEmpty;

  MyAppState({required this.categoryList, required this.courseList});

  void setCategoryList(List<Course> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
    notifyListeners();
  }

  void setCourseList(List<Course> courses) {
    courseList.clear();
    courseList.addAll(courses);
    notifyListeners();
  }

  void setSelectedCourse(Course course) {
    selectedCourse = course;
    notifyListeners();
  }
}
