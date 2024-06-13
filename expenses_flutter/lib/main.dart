import 'package:expenses_flutter/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context){
    return  MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transacion = [
    Transaction(
        id: 't1',
        title: 'Novo tenis de corrida',
        value: 550.00,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Conta de Luz',
        value: 310.00,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transacion.map((tr) {
              return Card (
              child: Text(tr.title),
              );
          }).toList(),
          )
        ],
      ),
    );
  }

}