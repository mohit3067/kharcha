import 'package:flutter/material.dart';
import 'package:kharcha/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
 final List<Transaction> transaction;
 final Function deletetx;
 TransactionList(this.transaction,this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.0,
      child: ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
                        child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              child: Container(
                                width: 70.0,
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      '\u{20B9}${transaction[index].amount.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 20.0
                                          ,color: Color.fromARGB(255, 8, 90, 204)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    transaction[index].title,
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromARGB (255, 8, 90, 204)),
                                  ),
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy').format(transaction[index].date),
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            IconButton(onPressed: ()=> deletetx(transaction[index].id), icon: Icon(Icons.delete),)
                          ],
                        ),

                      );
        },
                    itemCount: transaction.length,
                  ),
    );
  }
}