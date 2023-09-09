import 'package:flutter/material.dart';

import 'package:samples_design_course/src/course_info_screen.dart';
import 'package:samples_design_course/src/home_design_course.dart';
import 'package:samples_design_course/src/models/course.dart';

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
