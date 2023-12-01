import 'package:expenses/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.width,
    required this.placeholder,
    required this.number,
  });

  final double width;
  final TextEditingController controller;
  final String placeholder;
  final bool number;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        inputFormatters: number
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,2}$'),
                ),
              ]
            : <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'.*'),
                ),
              ],
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: darkBg,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: placeholder,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
