import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 499.9,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 199.9,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: (expense) => _addExpense(expense),
        );
      },
    );
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 4),
        content: const Text('Content deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget maincontent = const Center(
      child: Text('No expense found try adding some'),
    );
    if (_registeredExpenses.isNotEmpty) {
      setState(() {
        maincontent = ExpennsesList(
          expenses: _registeredExpenses,
          onRemoveExpense: removeExpense,
        );
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Expense Tracker',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
          ],
        ),
        body: size.width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(child: maincontent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(child: maincontent),
                ],
              ));
  }
}
