import 'package:first_app/models/chart_data.dart';
import 'package:first_app/models/transaction.dart';
import 'package:first_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  // ignore: use_key_in_widget_constructors
  const Chart(this.recentTransactions);

  List<ChartData> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      var amount = 0.0;

      for (var i = 0; i < recentTransactions.length; ++i) {
        if (recentTransactions[i].time.day == weekday.day &&
            recentTransactions[i].time.month == weekday.month &&
            recentTransactions[i].time.year == weekday.year) {
          amount += recentTransactions[i].amount;
        }
      }
      return ChartData(DateFormat.E().format(weekday).substring(0, 1), amount);
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(
        0.0, (previousValue, item) => previousValue + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions
              .map(
                (txn) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ChartBar(txn.day, txn.amount,
                        totalSpending == 0 ? 0 : txn.amount / totalSpending),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
