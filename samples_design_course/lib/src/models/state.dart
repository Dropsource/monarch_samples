import 'package:provider/provider.dart';

import 'category.dart';

class MyAppState {
  final List<Category> categoryList;
  final List<Category> courseList;

  MyAppState({required this.categoryList, required this.courseList});
}

final defaultAppState = MyAppState(
    categoryList: Category.categoryList,
    courseList: Category.popularCourseList);
