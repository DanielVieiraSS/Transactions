import 'package:expenses/constants.dart';
import 'package:expenses/screens/components/navigation.dart';
import 'package:expenses/screens/home/home.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.func,
  });

  final String text;
  final String func;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextButton(
        onPressed: () {
          func == "login"
              ? navigatePage(
                  context,
                  const Home(),
                )
              : navigatePage(
                  context,
                  const Home(),
                );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(darkBlue),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(20),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
