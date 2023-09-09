import 'package:flutter/material.dart';

import 'package:monarch_samples_pretty/src/design_course/course_info_screen.dart';
import 'package:monarch_samples_pretty/src/design_course/home_design_course.dart';
import 'package:monarch_samples_pretty/src/design_course/models/course.dart';

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
