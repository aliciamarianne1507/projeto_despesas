import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleControler = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleControler,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                  labelText: 'Valor (R\$)'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.purple,
                      backgroundColor: Colors.white
                  ),
                  child: const Text('Nova transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
