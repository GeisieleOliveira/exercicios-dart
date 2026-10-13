import 'package:flutter/material.dart';

void main() {
  runApp(AppTemaAzul());
}

class AppTemaAzul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema Azul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue.shade300,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('exerc 1 - ThemeData')),
      body: Center(child: CartaoTematico()),
    );
  }
}

class CartaoTematico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 150,
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 4,
        ),
      ),
      child: Text(
        'usa o tema azul do app',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
