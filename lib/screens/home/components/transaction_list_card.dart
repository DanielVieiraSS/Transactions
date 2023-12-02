import 'package:expenses/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListCard extends StatelessWidget {
  const TransactionListCard({
    super.key,
    required this.category,
    required this.date,
    required this.description,
    required this.value,
  });

  final String category;
  final double value;
  final String description;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("#,##0.00", "en_US");
    String numberFormatted = formatter.format(value);
    String dateFormatted = DateFormat('dd/MM/yyyy').format(date);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: paleBlue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "R\$ $numberFormatted",
            style: TextStyle(
              color: value < 0 ? red : green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            category,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            dateFormatted,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
