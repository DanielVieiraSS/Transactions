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
    required this.type,
    required this.screen,
  });

  final String category;
  final double value;
  final String description;
  final DateTime date;
  final String type;
  final bool screen;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("#,##0.00", "en_US");
    String numberFormatted = formatter.format(value);
    String dateFormatted = DateFormat('dd/MM/yyyy').format(date);
    return screen
        ? Container(
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
                  type == "saida"
                      ? "- R\$ $numberFormatted"
                      : "R\$ $numberFormatted",
                  style: TextStyle(
                    color: type == "saida" ? red : green,
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
          )
        : Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: paleBlue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  type == "saida"
                      ? "- R\$ $numberFormatted"
                      : "R\$ $numberFormatted",
                  style: TextStyle(
                    color: type == "saida" ? red : green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      dateFormatted,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
