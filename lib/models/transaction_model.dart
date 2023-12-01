class TransactionModel {
  const TransactionModel({
    required this.category,
    required this.date,
    required this.description,
    required this.value,
    required this.type,
  });

  final String category;
  final double value;
  final String description;
  final DateTime date;
  final String type;
}
