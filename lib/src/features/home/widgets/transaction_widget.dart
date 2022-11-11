import 'package:change_notifier/src/features/home/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        transaction.name,
        style: TextStyle(
            color: transaction.tipo == 'Entrada' ? Colors.black : Colors.red),
      ),
      subtitle: Text(
        transaction.category,
        style: TextStyle(
            color: transaction.tipo == 'Entrada' ? Colors.black : Colors.red),
      ),
      trailing: Text(
        transaction.value.toString(),
        style: TextStyle(
            color: transaction.tipo == 'Entrada' ? Colors.black : Colors.red),
      ),
    );
  }
}
