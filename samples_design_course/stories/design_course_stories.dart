import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:samples_design_course/src/category_list_view.dart';
import 'package:samples_design_course/src/course_info_screen.dart';
import 'package:samples_design_course/src/home_design_course.dart';
import 'package:samples_design_course/src/popular_course_list_view.dart';
import 'package:samples_design_course/src/models/state.dart';
import 'package:samples_design_course/src/models/category.dart';

Provider<MyAppState> _provider({required Widget child}) =>
    Provider.value(value: defaultAppState, child: child);

Widget home() => _provider(child: DesignCourseHomeScreen());

Widget category_list() => _provider(child: CategoryListView());

Widget popular_course_list() =>
    _provider(child: PopularCourseListView(callBack: () => null));

Widget category_section() => _provider(
    child: CategoryUI(
        categoryType: CategoryType.coding,
        callBack: () => null,
        onTap: (CategoryType categoryTypeData) {
          return null;
        }));

Widget course_details() => CourseInfoScreen(
      onBack: (p0) => null,
    );
