import 'package:expenses/constants.dart';
import 'package:expenses/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({
    super.key,
    required this.list,
  });

  final List<TransactionModel> list;

  @override
  Widget build(BuildContext context) {
    double entradas = 0.00;
    double saidas = 0.00;
    double total = 0.00;
    NumberFormat formatter = NumberFormat("#,##0.00", "en_US");

    for (var e in list) {
      if (e.type == "entrada") {
        entradas += e.value;
        total += e.value;
      }
      if (e.type == "saida") {
        saidas += e.value;
        total -= e.value;
      }
    }

    String formattedEntradas = formatter.format(entradas);
    String formattedSaidas = formatter.format(saidas);
    String formattedTotal = formatter.format(total);

    return SizedBox(
      width: double.infinity,
      height: 125,
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: lightBlue,
              ),
              padding: const EdgeInsets.all(20),
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Entradas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/Arrow_up.svg",
                        height: 32,
                        width: 32,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      "R\$ $formattedEntradas",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: lightBlue,
              ),
              padding: const EdgeInsets.all(20),
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Saídas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/Arrow_down.svg",
                        height: 32,
                        width: 32,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      "R\$ $formattedSaidas",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: yellow,
              ),
              padding: const EdgeInsets.all(20),
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/money.svg",
                        height: 32,
                        width: 32,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      "R\$ $formattedTotal",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
