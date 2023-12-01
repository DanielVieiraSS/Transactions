import 'package:expenses/constants.dart';
import 'package:expenses/screens/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NovaTransacao extends StatefulWidget {
  const NovaTransacao({super.key});

  @override
  State<NovaTransacao> createState() => _NovaTransacaoState();
}

class _NovaTransacaoState extends State<NovaTransacao> {
  // TextEditingController for the TextField
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  bool operation = false;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      contentPadding: const EdgeInsets.all(30),
      backgroundColor: const Color.fromARGB(255, 1, 25, 50),
      title: const Text(
        'Nova Transação',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        MyTextField(
          number: false,
          controller: descriptionController,
          width: 500,
          placeholder: "Descrição",
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 500,
          child: TextField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d+\.?\d{0,2}$'),
              ),
            ],
            controller: priceController,
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
              labelText: "Valor",
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: operation ? green : red,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MyTextField(
          number: false,
          controller: categoryController,
          width: 500,
          placeholder: "Categoria",
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF09182C),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    operation = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/Arrow_up.svg",
                      height: 32,
                      width: 32,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Entrada",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF09182C),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    operation = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/Arrow_down.svg",
                      height: 32,
                      width: 32,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Saída",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: ElevatedButton(
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 20,
                ),
              ),
              shape: const MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(
                paleBlue,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cadastrar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
