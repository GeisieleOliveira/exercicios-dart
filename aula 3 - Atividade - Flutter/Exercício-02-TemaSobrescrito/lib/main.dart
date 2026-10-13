import 'package:flutter/material.dart';

void main() {
  runApp(AppTemaSobrescrito());
}

class AppTemaSobrescrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema Sobrescrito',
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
      appBar: AppBar(title: Text('exerc 2 - tema sobrescrito')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CartaoTematico(legenda: 'tema original do app\n(azul)'),
            SizedBox(height: 28),

            Theme(
              data: ThemeData(
                scaffoldBackgroundColor: Colors.yellow.shade400,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              ),
              child: CartaoTematico(legenda: 'tema sobrescrito\n(amarelo)'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartaoTematico extends StatelessWidget {
  final String legenda;

  const CartaoTematico({required this.legenda});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 120,
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
        legenda,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
