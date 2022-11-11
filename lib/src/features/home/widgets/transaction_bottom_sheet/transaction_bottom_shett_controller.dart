import 'package:change_notifier/src/features/home/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';

class TransactionBottoSheetController extends ChangeNotifier {
  final List<String> categoryList = ['Viagem', 'Comida', 'Roupa', 'Transporte'];
  String name = '';
  String category = '';
  double value = 0;

  void onChagedCategory(String value) {
    category = value;

    notifyListeners();
  }

  TransactionModel onTap(bool isEntrada) {
    return TransactionModel(
      name: name,
      category: category,
      value: value,
      tipo: isEntrada ? 'Entrada' : 'Saida',
    );
  }
}
