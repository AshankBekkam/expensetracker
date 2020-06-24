import 'package:flutter/material.dart';
import 'package:practice_app/model/transaction.dart';

class Expense extends StatelessWidget {
  Transaction transaction;

  Expense({@required this.transaction});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            /*child: Row(

        children: <Widget>[
          Container(
            height: 100,
            padding: EdgeInsets.all(30),
            child: Text(
              transaction.amount.toString(),
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
          ),
          Flexible(
            child: Container(

              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.title.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${transaction.dateTime.day}/${transaction.dateTime.month}/${transaction.dateTime.year%1000}",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      )*/
            child: ListTile( contentPadding: EdgeInsets.all(10),
      title: Text(
        transaction.title.toString(),
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        "${transaction.dateTime.day}/${transaction.dateTime.month}/${transaction.dateTime.year % 1000}",
        style: TextStyle(fontSize: 15),
      ),
      leading: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Text("₹${transaction.amount.toString()}",style: TextStyle(fontSize:30 ),),
      ),
    )));
  }
}
