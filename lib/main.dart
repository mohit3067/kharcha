import 'package:flutter/material.dart';
import 'package:kharcha/chart.dart';
import 'package:kharcha/newtransct.dart';
import 'transaction.dart';
import 'transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Transaction> userTransaction = [
    // Transaction(id: 't1', title: 'food', amount: 120, date: DateTime.now()),
    // Transaction(id: 't2', title: 'fod', amount: 150, date: DateTime.now())
  ];

  Iterable<Transaction>get recenttransaction{
    return userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),));
    } );
  }

  void addNewTransaction(String txTitle, double txAmount,DateTime choosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: choosenDate);

    setState(() {
      userTransaction.add(newTx);
    });
  }

void deletetransaction(String id){
setState(() {
  userTransaction.removeWhere((tx){
    return tx.id == id;
  });
});
}

  void sant(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: newtransaction(addNewTransaction),
            onTap: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Kharcha')),
           
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                
               chart(recenttransaction.toList()),
                TransactionList(userTransaction,deletetransaction),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () => sant(context),
            child: Icon(Icons.add),
          ),
        ));
  }
}
