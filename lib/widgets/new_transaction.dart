import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  addTxHandler() {
    if (titleController.text == "" ||
        double.parse(amountController.text) <= 0) {
      return;
    }

    addTransaction(Transaction(
      id: 'id',
      name: titleController.text,
      amount: double.parse(amountController.text),
      time: DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
            keyboardType: TextInputType.number,
            controller: amountController,
            onSubmitted: (_) => addTxHandler(),
          ),
          TextButton(
            onPressed: addTxHandler,
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
