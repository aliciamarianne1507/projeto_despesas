// ignore_for_file: use_key_in_widget_constructors

import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Despesas pessoais"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Card(
              color: Colors.blue,
              elevation: 10,
              child: Text('Gráfico'),
            ),
            TransactionUser()
          ],
        ));
  }
}
