import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(AppLogin());
}

class AppLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login - aula 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: TelaLogin(),
    );
  }
}
