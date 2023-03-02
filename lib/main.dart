// ignore_for_file: use_key_in_widget_constructors

import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'components/transaction_list.dart';
import 'models/transactions.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatefulWidget {

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {


  final _transactions = [
    Transactions(
        id: 't1',
        title: 'Novo tênis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transactions(
        id: 't2', title: 'Conta de luz', value: 211.30, date: DateTime.now()),
  ];


  _addTransaction(String title, double value){
    final newTransaction = Transactions(id: Random().nextDouble().toString(),
        title: title, value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }


  _openTranscationFormModal(BuildContext context){
    showModalBottomSheet(context: context,
        builder: (_){
          return TransactionForm(_addTransaction);
        }
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Despesas pessoais"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
                onPressed: ()=> _openTranscationFormModal(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Container(
                child: Card(
                  color: Colors.blue,
                  elevation: 10,
                  child: Text('Gráfico'),
                ),
              ),
              Column(
                children: [
                  TransactionForm(_addTransaction),
                  TransactionList(_transactions),
              ])
            ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> _openTranscationFormModal(context),
    ),
    );
  }
}
