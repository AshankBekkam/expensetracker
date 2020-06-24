import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './expense.dart';


class transactionList extends StatelessWidget {

  final List<Transaction> transactions;
  transactionList({this.transactions});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Expense(
          transaction: tx,
        );
      }).toList(),
    );
  }
}