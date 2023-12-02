import 'package:expenses/constants.dart';
import 'package:expenses/screens/home/components/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.func,
  });

  final Function(
    String description,
    double price,
    String category,
    String type,
    String userId,
  ) func;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
                height: 35,
                width: 35,
              ),
              const Text(
                "Transaction",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.all(16),
              ),
              backgroundColor: MaterialStatePropertyAll(
                paleBlue,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return NovaTransacao(
                        func: (
                          String description,
                          double price,
                          String category,
                          String type,
                          String userId,
                        ) {
                          func(
                            description,
                            price,
                            category,
                            type,
                            userId,
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
            child: const Text(
              "Nova transação",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
