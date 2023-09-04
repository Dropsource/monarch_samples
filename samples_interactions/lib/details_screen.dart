
import 'package:flutter/material.dart';
import 'package:samples_interactions/model/expense.dart';

class DetailsScreen extends StatefulWidget {
  final Expense expense;

  const DetailsScreen({Key? key, required this.expense}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Expense _expense;

  @override
  void initState() {
    _expense = widget.expense;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBE9EF),
        appBar: AppBar(
          title: const Text("Expense"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
                width: double.infinity,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.yellow, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    _expense.title[0],
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text("${_expense.title} - \$${_expense.amount}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 4,
              ),
              Text(_expense.date,
                  style: const TextStyle(fontSize: 16, color: Colors.blueGrey)),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                  width: 240,
                  height: 40,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text("Edit Expense")))
            ],
          ),
        ));
  }
}
