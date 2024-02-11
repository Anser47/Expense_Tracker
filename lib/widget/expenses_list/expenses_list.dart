import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpennsesList extends StatelessWidget {
  const ExpennsesList({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index])
    );
  }
}
