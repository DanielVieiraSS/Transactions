class TransactionModel {
  const TransactionModel({
    required this.category,
    required this.date,
    required this.description,
    required this.value,
  });

  final String category;
  final double value;
  final String description;
  final DateTime date;
}
