import 'package:samples_interactions/details_screen.dart';
import 'package:samples_interactions/expense_card_widget.dart';
import 'package:samples_interactions/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseListWidget extends StatelessWidget {
  final List<Expense> expenses;
  final RouteTransitionsBuilder transitionBuilder;

  const ExpenseListWidget({
    super.key,
    required this.expenses,
    required this.transitionBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (BuildContext context, int index) {
          var expense = expenses[index];
          return GestureDetector(
            child: ExpenseCard(
              expense: expense,
            ),
            onTap: () {
              PageRouteBuilder pageRoute = PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    DetailsScreen(expense: expense),
                transitionsBuilder: transitionBuilder,
              );
              Navigator.of(context).push(
                pageRoute,
              );
            },
          );
        });
  }
}
