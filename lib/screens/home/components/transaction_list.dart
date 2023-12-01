import 'package:expenses/constants.dart';
import 'package:expenses/screens/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyTextField(
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
          )
        ],
      ),
    );
  }
}
