// ignore_for_file: depend_on_referenced_packages

import 'package:expenses/constants.dart';
import 'package:expenses/models/transaction_model.dart';
import 'package:expenses/supabase/instance.dart';
import 'package:intl/intl.dart';

Future<List<TransactionModel>> fetchTransactionsHandler() async {
  List transactions = await supabase
      .from('transactions')
      .select("*")
      .eq('userId', loggedUser!.id);

  return transactions.map((transaction) {
    return TransactionModel(
      category: transaction['category'],
      date: transaction['created_at'],
      description: transaction['description'],
      value: double.parse(transaction['price'].toString()),
      type: transaction['type'],
    );
  }).toList();
}

Future<TransactionModel> saveTransactionHandler(
  String description,
  double price,
  String category,
  String userId,
  String type,
) async {
  String dateFormatted = DateFormat('dd/MM/yyyy').format(DateTime.now());

  Map<String, dynamic> payload = {
    "userId": userId,
    "description": description,
    "price": price,
    "category": category,
    'type': type,
    'created_at': dateFormatted,
  };

  await supabase.from('transactions').insert(payload);

  return TransactionModel(
    category: category,
    date: dateFormatted,
    description: description,
    value: price,
    type: type,
  );
}
