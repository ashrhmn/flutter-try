import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  const NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  addTxHandler() {
    if (titleController.text == "" ||
        double.parse(amountController.text) <= 0) {
      return;
    }

    widget.addTransaction(Transaction(
      id: 'id',
      name: titleController.text,
      amount: double.parse(amountController.text),
      time: DateTime.now(),
    ));
    Navigator.of(context).pop();
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
