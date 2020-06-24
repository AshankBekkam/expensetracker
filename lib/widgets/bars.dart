import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double percent;

  Bar(
      {@required this.label,
      @required this.amountSpent,
      @required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text(amountSpent.toStringAsFixed(0))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(height: percent*100,decoration: BoxDecoration(
                color: Colors.yellow,borderRadius: BorderRadius.circular(10)
              ),)



            ],
          ),
        ),
        Text(label)
      ],
    );
  }
}
