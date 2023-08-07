import 'package:flutter/material.dart';

class chartBar extends StatelessWidget {
  final String label;
  final double spendingamount;
  final double spendingpctoftotal;
  chartBar(this.label, this.spendingamount, this.spendingpctoftotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\u{20B9}${spendingamount.toStringAsFixed(2)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                alignment : Alignment.center,
                widthFactor: 0.8,
                heightFactor: spendingpctoftotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
