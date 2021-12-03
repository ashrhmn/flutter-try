import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  const NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? _selectedDate;

  addTxHandler() {
    if (titleController.text == "" ||
        double.parse(amountController.text) <= 0) {
      return;
    }

    widget.addTransaction(Transaction(
      id: DateTime.now().toString(),
      name: titleController.text,
      amount: double.parse(amountController.text),
      time: _selectedDate == null ? DateTime.now() : _selectedDate as DateTime,
    ));
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 40,
        ),
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
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date chosen'
                        : 'Picked Date : ${DateFormat.yMd().format(_selectedDate as DateTime)}'),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: addTxHandler,
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
