// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

insertSupabase(
  String description,
  double price,
  String category,
  String userId,
  String type,
) async {
  final supabase = Supabase.instance.client;
  String dateFormatted = DateFormat('dd/MM/yyyy').format(
    DateTime.now(),
  );

  await supabase.from('transactions').insert(
    {
      'created_at': dateFormatted,
      "description": description,
      "price": price,
      "category": category,
      "userId": userId,
      'type': type,
    },
  );
}
