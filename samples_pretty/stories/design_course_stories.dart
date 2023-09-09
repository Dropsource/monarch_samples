import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monarch_samples_pretty/src/design_course/alert_dialog.dart';

import 'package:monarch_samples_pretty/src/design_course/category_list_view.dart';
import 'package:monarch_samples_pretty/src/design_course/course_info_screen.dart';
import 'package:monarch_samples_pretty/src/design_course/home_design_course.dart';
import 'package:monarch_samples_pretty/src/design_course/popular_course_list_view.dart';
import 'package:monarch_samples_pretty/src/design_course/models/state.dart';
import 'package:monarch_samples_pretty/src/design_course/models/course.dart';

MyAppState get emptyAppState => MyAppState(
      categoryList: [],
      courseList: [],
    );

MyAppState get defaultAppState => MyAppState(
      categoryList: Course.categoryList,
      courseList: Course.popularCourseList,
    );

extension on Widget {
  Widget story(MyAppState appState) => ChangeNotifierProvider.value(
        value: appState,
        child: this,
      );
}

Widget home_loading() => const DesignCourseHomeScreen().story(emptyAppState);

Widget home_loaded() => const DesignCourseHomeScreen().story(defaultAppState);

Widget categories_loading() => const CategoryListView().story(emptyAppState);

Widget categories_loaded() => const CategoryListView().story(defaultAppState);

Widget popular_courses_loading() => PopularCourseListView(callBack: (_) => null).story(emptyAppState);
Widget popular_courses_loaded() => PopularCourseListView(callBack: (_) => null).story(defaultAppState);

Widget category_section() => CategoryUI(
      categoryType: CategoryType.coding,
      callBack: (_) => null,
      onTap: (CategoryType categoryTypeData) {
        return null;
      },
    ).story(defaultAppState);

Widget details_active() => CourseInfoScreen(
      course: Course(
        imagePath: 'assets/design_course/team.png',
        title: 'Flutter Programming',
        lessonCount: 12,
        money: 250,
        rating: 4.8,
        isActive: true,
        categoryType: CategoryType.coding,
      ),
      onBack: (p0) => null,
    );

Widget details_inactive() => CourseInfoScreen(
      course: Course(
        imagePath: 'assets/design_course/team.png',
        title: 'Flutter Programming',
        lessonCount: 12,
        money: 250,
        rating: 4.8,
        isActive: false,
        categoryType: CategoryType.coding,
      ),
      onBack: (p0) => null,
    );

Widget dialog() => CourseAlertDialog();
