import 'package:samples_interactions/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 58,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      expense.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      expense.date,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.blueGrey),
                    ),
                  ],
                )
              ],
            ),
            Text(
              "\$${expense.amount}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
