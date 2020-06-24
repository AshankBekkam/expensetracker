import 'dart:math';

import '../model/transaction.dart';
import 'package:flutter/material.dart';

class bottomsheet extends StatefulWidget {
  final Function addTx;

  bottomsheet({this.addTx});

  @override
  _bottomsheetState createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title == null || amount < 0 || amount == null) {
      return;
    }
    widget.addTx(title, amount);
    amountController.clear();
    titleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Wrap(
        children: <Widget>[
          TextField(
            onSubmitted: (_) => submitData(),
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              contentPadding: EdgeInsets.all(30),
              border: InputBorder.none,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Price',
              contentPadding: EdgeInsets.all(30),
              border: InputBorder.none,
            ),
          ),
          Center(
            child: FlatButton(child: Text("Add"), onPressed: submitData),
          )
        ],
      ),
    );
  }
}
