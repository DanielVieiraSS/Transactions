import 'package:expenses/constants.dart';
import 'package:expenses/handlers/transaction.handlers.dart';
import 'package:expenses/models/transaction_model.dart';
import 'package:expenses/screens/home/components/app_bar.dart';
import 'package:expenses/screens/home/components/general_info.dart';
import 'package:expenses/screens/home/components/transaction_list_card.dart';
import 'package:expenses/supabase/instance.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TransactionModel> transactionList = [];

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  fetchTransactions() async {
    List data = await supabase
        .from('transactions')
        .select("*")
        .eq('userId', loggedUser!.id);

    setState(() {
      transactionList = data.map((e) {
        return TransactionModel(
          category: e['category'],
          date: e['created_at'],
          description: e['description'],
          value: double.parse(e['price'].toString()),
          type: e['type'],
        );
      }).toList();
    });
  }

  newTransaction(
    String description,
    double price,
    String category,
    String type,
    String userId,
  ) {
    insertSupabase(description, price, category, userId, type);

    fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: darkBg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: MyAppBar(
            func: (
              String description,
              double price,
              String category,
              String type,
              String userId,
            ) {
              newTransaction(
                description,
                price,
                category,
                type,
                userId,
              );
            },
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: lightBg,
        ),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            GeneralInfo(
              list: transactionList,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: transactionList.length,
                          separatorBuilder: (context, index) => const SizedBox(
                              height: 10), // Separator between items
                          itemBuilder: (context, index) {
                            return TransactionListCard(
                              screen: screenWidth > 800 ? true : false,
                              category: transactionList[index].category,
                              date: transactionList[index].date,
                              description: transactionList[index].description,
                              value: transactionList[index].value,
                              type: transactionList[index].type,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Membros do Grupo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Daniel Vieira RA: 1431432312007",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Felipe Thaylan RA: 1431432312030",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Lucas Passos RA: 1431432312007",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Victor Hugo RA: 1431432312001",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Matheus Silva RA: 1431432312017",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
