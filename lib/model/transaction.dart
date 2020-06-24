import 'package:flutter/foundation.dart';

class Transaction {
  final int id;
  final String title;
  final double amount;
  final String currency;
  final DateTime dateTime;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.currency,
    @required this.dateTime});
}
