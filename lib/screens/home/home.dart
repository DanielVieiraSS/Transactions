import 'package:expenses/screens/home/components/app_bar.dart';
import 'package:expenses/screens/home/components/general_info.dart';
import 'package:expenses/screens/home/components/transaction_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBar(),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const Column(
          children: [
            GeneralInfo(),
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
