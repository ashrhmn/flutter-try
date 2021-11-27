import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem(this.transaction, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Container(
              child: Text(
                '\$' + transaction.amount.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
                textAlign: TextAlign.right,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              width: 80,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('yMMMd').format(transaction.time),
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
