import 'package:samples_interactions/expense_list_widget.dart';
import 'package:samples_interactions/model/expense_list_data.dart';
import 'package:flutter/material.dart';

Widget noTransition() => ExpenseListWidget(
    expenses: expenses,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    });

Widget bottomUpTransition() => ExpenseListWidget(
      expenses: expenses,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );

Widget rightToLeftTransition() => ExpenseListWidget(
      expenses: expenses,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
        Animation<Offset> offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
