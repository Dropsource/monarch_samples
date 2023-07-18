import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_design_course/src/alert_dialog.dart';

import 'package:samples_design_course/src/category_list_view.dart';
import 'package:samples_design_course/src/course_info_screen.dart';
import 'package:samples_design_course/src/home_design_course.dart';
import 'package:samples_design_course/src/popular_course_list_view.dart';
import 'package:samples_design_course/src/models/state.dart';
import 'package:samples_design_course/src/models/course.dart';

MyAppState get emptyAppState => MyAppState(categoryList: [], courseList: []);

MyAppState get defaultAppState => MyAppState(
    categoryList: Course.categoryList, courseList: Course.popularCourseList);

ChangeNotifierProvider<MyAppState> _provider(
        {required MyAppState appState, required Widget child}) =>
    ChangeNotifierProvider.value(value: appState, child: child);

Widget home_loading() =>
    _provider(appState: emptyAppState, child: DesignCourseHomeScreen());
Widget home_loaded() =>
    _provider(appState: defaultAppState, child: DesignCourseHomeScreen());

Widget categories_loading() =>
    _provider(appState: emptyAppState, child: CategoryListView());
Widget categories_loaded() =>
    _provider(appState: defaultAppState, child: CategoryListView());

Widget popular_courses_loading() => _provider(
    appState: emptyAppState,
    child: PopularCourseListView(callBack: (_) => null));
Widget popular_courses_loaded() => _provider(
    appState: defaultAppState,
    child: PopularCourseListView(callBack: (_) => null));

Widget category_section() => _provider(
    appState: defaultAppState,
    child: CategoryUI(
        categoryType: CategoryType.coding,
        callBack: (_) => null,
        onTap: (CategoryType categoryTypeData) {
          return null;
        }));

Widget course_details_active() => CourseInfoScreen(
      course: Course(
        imagePath: 'assets/design_course/team.png',
        title: 'Flutter Programming',
        lessonCount: 12,
        money: 250,
        rating: 4.8,
        isActive: true,
      ),
      onBack: (p0) => null,
    );

Widget course_details_inactive() => CourseInfoScreen(
      course: Course(
        imagePath: 'assets/design_course/team.png',
        title: 'Flutter Programming',
        lessonCount: 12,
        money: 250,
        rating: 4.8,
        isActive: false,
      ),
      onBack: (p0) => null,
    );

Widget course_dialog() => CourseAlertDialog();