import 'dart:ffi';

import 'package:expenses_flutter/components/chart_bar.dart';
import 'package:expenses_flutter/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentsTransections;

  Chart(this.recentsTransections);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {

      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for(var i = 0 ; i < recentsTransections.length ; i++){
        bool samedDay = recentsTransections[i].date.day == weekDay.day;
        bool samedMonth = recentsTransections[i].date.month == weekDay.month;
        bool samedYear = recentsTransections[i].date.year == weekDay.year;

        if(samedDay && samedMonth && samedYear){
          totalSum += recentsTransections[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr){
          return ChartBar(
            label: tr['day'] as String ,
            value: tr['value'] as double,
            percentage: 0.3,
          );
        }).toList(),
      ),
    );
  }

}
