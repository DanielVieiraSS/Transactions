import 'package:expenses/constants.dart';
import 'package:expenses/handlers/user.handlers.dart';
import 'package:expenses/screens/components/navigation.dart';
import 'package:expenses/screens/components/text_field.dart';
import 'package:expenses/screens/login_register/components/buttons.dart';
import 'package:expenses/screens/login_register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isFetching = false;

  Future<void> authenticateUser() async {
    setState(() => isFetching = true);

    authenticateUserHandler(
      context,
      emailController.text,
      passwordController.text,
    );

    setState(() => isFetching = false);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 10,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xFF28282D),
            ),
            width: 150,
            height: 6,
          ),
        ),
      ),
      backgroundColor: lightBg,
      body: Container(
        margin: const EdgeInsets.only(top: 40, right: 16, left: 16, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
                height: 180,
                width: 180,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "TRANSACTIONS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                number: false,
                placeholder: "Email",
                width: 400,
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                number: false,
                placeholder: "Senha",
                width: 400,
                controller: passwordController,
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                text: "Entrar",
                onPressed: () {
                  authenticateUser();
                },
                isFetching: isFetching,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não tem uma conta? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        navigationPageRightAnimation(
                          const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Criar Conta",
                      style: TextStyle(
                        color: Color(0xFF119BFF),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
