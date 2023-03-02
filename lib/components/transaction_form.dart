import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
    final title = titleControler.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onSubmitted: (_)=> _submitForm(),
              controller: titleControler,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_)=> _submitForm(),
              controller: valueController,
              decoration: InputDecoration(
                  labelText: 'Valor (R\$)'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: _submitForm,
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
