import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget{
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (\$)',
              ),
            ),
            TextButton(
              child: const Text(
                'Nova Transação',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: () {
                print(titleController.text);
                print(valueController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
  
}