// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:bcrypt/bcrypt.dart';
import 'package:expenses/components/alert.dart';
import 'package:expenses/constants.dart';
import 'package:expenses/models/user_model.dart';
import 'package:expenses/screens/components/navigation.dart';
import 'package:expenses/screens/home/home.dart';
import 'package:expenses/supabase/instance.dart';
import 'package:flutter/material.dart';

Future<void> createUserHandler(BuildContext context, UserModel user) async {
  try {
    List<dynamic> data = await supabase
        .from("users")
        .select("id")
        .eq("email", user.email.toLowerCase());

    if (data.isNotEmpty) throw "Usuário com E-mail ${user.email} já existe";

    var (password, salt) = hashPassword(user.password);

    Map<String, dynamic> payload = {
      "id": user.id,
      "name": user.name.toLowerCase(),
      "email": user.email,
      "password": password,
      "salt": salt,
      "created_at": user.createdAt.toIso8601String()
    };

    await supabase.from("users").insert(payload);

    loggedUser = user;

    navigatePage(
      context,
      const Home(),
    );
  } catch (error) {
    showAlertDialog(context, "Erro ao criar usuário", error.toString());
  }
}

Future<void> authenticateUserHandler(
  BuildContext context,
  String email,
  String password,
) async {
  try {
    List<dynamic> data =
        await supabase.from("users").select("*").eq("email", email);

    if (data.isEmpty) throw "E-mail ou senha está errado";

    Map<String, dynamic> userMap = data[0];

    UserModel loggedUser = UserModel(
      userMap["name"],
      userMap["email"],
      userMap["password"],
    );

    loggedUser.id = userMap['id'];
    loggedUser.createdAt = DateTime.parse(userMap['created_at']);

    bool isPasswordRight =
        verifyPassword(password, userMap['password'], userMap['salt']);

    if (isPasswordRight) {
      navigatePage(
        context,
        const Home(),
      );
    } else {
      throw "E-mail ou senha está errado";
    }
  } catch (error) {
    showAlertDialog(context, "Erro ao se autenticar", error.toString());
  }
}

(String, String) hashPassword(String password) {
  String salt = BCrypt.gensalt();
  String hashedPassword = BCrypt.hashpw(password, salt);
  return (hashedPassword, salt);
}

bool verifyPassword(
  String enteredPassword,
  String storedHashedPassword,
  String storedSalt,
) {
  String hashedEnteredPassword = BCrypt.hashpw(enteredPassword, storedSalt);

  return hashedEnteredPassword == storedHashedPassword;
}
