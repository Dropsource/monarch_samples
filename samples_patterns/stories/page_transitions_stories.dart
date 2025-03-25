
import 'package:flutter/material.dart';
import 'package:monarch_samples_patterns/page_transitions/expense_list_widget.dart';
import 'package:monarch_samples_patterns/page_transitions/model/expense_list_data.dart';

Widget no_transition() => ExpenseListWidget(
    expenses: expenses,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    });

Widget bottom_up_transition() => ExpenseListWidget(
      expenses: expenses,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );

Widget right_to_left_transition() => ExpenseListWidget(
      expenses: expenses,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
        Animation<Offset> offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
