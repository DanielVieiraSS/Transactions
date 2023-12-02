import 'package:expenses/constants.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: darkBg,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBar(),
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
            const GeneralInfo(
              total: 16141.00,
              saidas: 1259.00,
              entradas: 17400.00,
            ),
            const SizedBox(
              height: 30,
            ),
            TransactionList(
              screen: screenWidth > 800 ? true : false,
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
