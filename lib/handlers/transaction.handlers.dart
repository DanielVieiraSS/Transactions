import 'package:supabase_flutter/supabase_flutter.dart';

insertSupabase(
  String id,
  DateTime createdAt,
  String description,
  double price,
  String category,
  String userId,
) async {
  final supabase = Supabase.instance.client;

  await supabase.from('transactions').insert(
    {
      'id': id,
      'createdAt': createdAt,
      "description": description,
      "price": price,
      "category": category,
      "userId": userId,
    },
  );
}
