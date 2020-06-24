import 'package:flutter/material.dart';
import 'package:practice_app/model/transaction.dart';
import './transaction_list.dart';
import './appbar.dart';
import './bottombar.dart';
import './bottomsheet.dart';
import './chart.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

  List<Transaction> transactions = [
    /*Transaction(
        id: 1,
        title: 'Adidas Ultraboost',
        amount: 19000.0,
        currency: 'INR',
        dateTime: DateTime.now()),
    Transaction(
        id: 1,
        title: 'MFC Chicken taco',
        amount: 100.0,
        currency: 'INR',
        dateTime: DateTime.now())*/
  ];

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.dateTime.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    void _addNewTransaction(String txTitle, double txAmount) {
      final newTx = Transaction(
          title: txTitle, amount: txAmount, id: 5, dateTime: DateTime.now());

      widget.transactions.add(newTx);
      Navigator.of(context).pop();
      print(widget.transactions.length);
    }

    void _settingModalBottomSheet(context) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext bc) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: bottomsheet(addTx: _addNewTransaction),
            );
          });
    }

    return Scaffold(
      appBar: myAppBar(
        appBar: AppBar(),
        title: 'EXPENSE TRACKER',
      ),
      body: ListView(children: <Widget>[
        Chart(widget._recentTransactions),
        transactionList(
          transactions: widget.transactions,
        )
      ]),
      bottomNavigationBar: myBottomBar(),
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _settingModalBottomSheet(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
