import 'package:flutter/material.dart';
import 'package:practice_app/widgets/bars.dart';
import 'package:practice_app/widgets/transaction_list.dart';
import './bars.dart';

import '../model/transaction.dart';
import 'package:intl/intl.dart';
class Chart extends StatelessWidget {


  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          totalSum+= recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {


    print(groupedTransactionValues[3]['amount']);
    return Container(
      child:Card(
        child: Container(padding: EdgeInsets.only(bottom: 10,top: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues.map((tx)
            {
              return Flexible(fit: FlexFit.tight,
                child: Bar(label:tx['day'],amountSpent:tx['amount'],percent:totalSpending==0.0?0.0:(tx['amount'] as double)/totalSpending  ,

                ),
              );
            }).toList(),

          ),
        ),
      )
    );
  }
}
