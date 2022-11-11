import 'package:change_notifier/src/features/home/models/transaction_model.dart';
import 'package:change_notifier/src/shared/services/current_states.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<TransactionModel> transactions = [];
  CurrentStatus status = CurrentStatus.empty;

  void setTransaction(TransactionModel transaction) async {
    status = CurrentStatus.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    transactions.add(transaction);
    status = CurrentStatus.success;
    notifyListeners();
  }
}
