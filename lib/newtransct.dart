

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class newtransaction extends StatefulWidget {

final addTX;

newtransaction(this.addTX);

  @override
  State<newtransaction> createState() => _newtransactionState();
}

class _newtransactionState extends State<newtransaction> {
   final Titlecontroller = TextEditingController();

final amountcontroller = TextEditingController();
 DateTime? selecteddate;

void submitData(){
  if(amountcontroller.text.isEmpty){return;}
  final enteredTitle= Titlecontroller.text;
  final enteredAmount = double.parse(amountcontroller.text);
if(enteredTitle.isEmpty || enteredAmount <=0 || selecteddate==null){
  return;
}

 widget.addTX(enteredTitle,enteredAmount,selecteddate);
 Navigator.of(context).pop();
}

void presentDatePicker(){
  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime.now()).then((pickeddate){
if(pickeddate==null){
  return;
}
setState(() {
selecteddate = pickeddate;
  
});
  });
}
  @override


  Widget build(BuildContext context) {
    return  Card(elevation: 5,child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(decoration: InputDecoration(labelText: 'title'),
                    controller: Titlecontroller,
                      onSubmitted: (_)=>submitData(),
                   ),
                    TextField(decoration: InputDecoration(labelText: 'amount'),
                    controller: amountcontroller,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_)=>submitData(),),
                    Row(children: [
                      Expanded(child: Text(selecteddate==null?'No Date has choosen': DateFormat.yMd().format(selecteddate!))),
                      TextButton( onPressed: presentDatePicker, child: Text('choose date',style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),))
                    ],),
                    TextButton(onPressed: (){
                       submitData();
                    }, child: Text('add transaction',style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),)),
                    
                  ],
                ),
              ),
    );
  }
}