import 'package:expenses/constants.dart';
import 'package:expenses/models/transaction_model.dart';
import 'package:expenses/screens/components/text_field.dart';
import 'package:expenses/screens/home/components/transaction_list_card.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  TextEditingController searchController = TextEditingController();
  List<TransactionModel> transactions = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  number: false,
                  controller: searchController,
                  width: 1800,
                  placeholder: "Busque uma transação",
                ),
              ),
              const SizedBox(width: 5),
              IconButton.filled(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(darkBlue),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: const PhosphorIcon(
                  Icons.search,
                  size: 38,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: transactions.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 10), // Separator between items
            itemBuilder: (context, index) {
              return TransactionListCard(
                category: transactions[index].category,
                date: transactions[index].date,
                description: transactions[index].description,
                value: transactions[index].value,
              );
            },
          ),
        ],
      ),
    );
  }
}
