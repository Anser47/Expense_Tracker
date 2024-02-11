import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _texEditingController = TextEditingController();
  final _amountEditingController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _texEditingController.dispose();
    _amountEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _texEditingController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: _texEditingController,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}