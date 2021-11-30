import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
            controller: amountController,
          ),
          TextButton(
            onPressed: () => {
              addTransaction(Transaction(
                id: 'id',
                name: titleController.text,
                amount: double.parse(amountController.text),
                time: DateTime.now(),
              ))
            },
            child: const Text(
              'Add Transaction',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
