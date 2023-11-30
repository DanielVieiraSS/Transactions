import 'package:expenses/screens/login/login.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://cwbzhbjdndjhvotrjloc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN3YnpoYmpkbmRqaHZvdHJqbG9jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEzNjgxODIsImV4cCI6MjAxNjk0NDE4Mn0.BCsz9-RE0oEEiJ5fJnSE1tbsSuPSd876AP1aaF_1o5E',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
