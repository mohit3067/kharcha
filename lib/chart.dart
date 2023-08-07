import 'package:flutter/material.dart';
import 'package:kharcha/chartbar.dart';
import 'package:kharcha/transaction.dart';
import 'package:intl/intl.dart';

class chart extends StatelessWidget {
  final List<Transaction> recenttransaction;

  chart(this.recenttransaction);
  List<Map<String, Object>> get GTV {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.0;

      for (var i = 0; i < recenttransaction.length; i++) {
        if (recenttransaction[i].date.day == weekday.day &&
            recenttransaction[i].date.month == weekday.month &&
            recenttransaction[i].date.year == weekday.year) {
          totalsum += recenttransaction[i].amount;
        }
      }
     
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get totalpending {
    return GTV.fold(0.0, (sum, item) {
      return sum + (item['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: GTV.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: chartBar(
                data['day'].toString(),
                data['amount'] as double,
                totalpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalpending),
          );
        }).toList()),
      ),
    );
  }
}
