import 'package:samples_design_course/src/home_design_course.dart';

class Course {
  Course({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
    this.isActive = false,
    this.seats = 23,
    required this.categoryType,
  });

  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;
  bool isActive;
  int seats;
  CategoryType categoryType;

  static List<Course> get categoryList => <Course>[
        Course(
          imagePath: 'assets/design_course/interFace1.png',
          title: 'User Interface Design',
          lessonCount: 24,
          money: 25,
          rating: 4.3,
          seats: 15,
          categoryType: CategoryType.ui,
        ),
        Course(
          imagePath: 'assets/design_course/interFace2.png',
          title: 'User Research',
          lessonCount: 22,
          money: 18,
          rating: 4.6,
          seats: 25,
          categoryType: CategoryType.ui,
        ),
        Course(
          imagePath: 'assets/design_course/interFace1.png',
          title: 'Product Strategy',
          lessonCount: 24,
          money: 25,
          rating: 4.3,
          seats: 11,
          categoryType: CategoryType.ui,
        ),
        Course(
          imagePath: 'assets/design_course/interFace2.png',
          title: 'Graphic Design',
          lessonCount: 22,
          money: 18,
          rating: 4.6,
          seats: 13,
          categoryType: CategoryType.ui,
        ),
      ];

  static List<Course> get popularCourseList => <Course>[
        Course(
          imagePath: 'assets/design_course/team.png',
          title: 'Flutter Programming',
          lessonCount: 12,
          money: 250,
          rating: 4.8,
          seats: 10,
          isActive: true,
          categoryType: CategoryType.coding,
        ),
        Course(
          imagePath: 'assets/design_course/team.png',
          title: 'React Native Programming',
          lessonCount: 12,
          money: 250,
          rating: 4.8,
          seats: 10,
          isActive: false,
          categoryType: CategoryType.coding,
        ),
        Course(
          imagePath: 'assets/design_course/interFace1.png',
          title: 'User Interface Design',
          lessonCount: 24,
          money: 25,
          rating: 4.3,
          seats: 15,
          categoryType: CategoryType.ui,
        ),
        Course(
          imagePath: 'assets/design_course/interFace3.png',
          title: 'Sketch Fundamentals',
          lessonCount: 7,
          money: 25,
          rating: 5.0,
          categoryType: CategoryType.ui,
        ),
        Course(
          imagePath: 'assets/design_course/interFace4.png',
          title: 'Web Design Course',
          lessonCount: 28,
          money: 208,
          rating: 4.9,
          categoryType: CategoryType.ui,
        ),
        Course(
          imagePath: 'assets/design_course/interFace3.png',
          title: 'Mobile UX',
          lessonCount: 2,
          money: 231,
          rating: 4.7,
          categoryType: CategoryType.ui,
        ),
        Course(
          imagePath: 'assets/design_course/interFace4.png',
          title: 'AI UX',
          lessonCount: 5,
          money: 300,
          rating: 4.1,
          categoryType: CategoryType.ui,
        ),
      ];
}
