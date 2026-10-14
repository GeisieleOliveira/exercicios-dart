import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'exerc - responsividade',
      theme: ThemeData(colorSchemeSeed: Colors.pink, useMaterial3: true),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final emPe = MediaQuery.of(context).orientation == Orientation.portrait;

    const titulo = Text('Cheetah Coding', style: TextStyle(fontSize: 26));

    final botaoUm = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        minimumSize: const Size(120, 36),
      ),
      onPressed: () {},
      child: const Text('BUTTON 1'),
    );

    final botaoDois = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        minimumSize: const Size(120, 36),
      ),
      onPressed: () {},
      child: const Text('BUTTON 2'),
    );

    final nomes = ['Dart', 'JavaScript', 'PHP', 'C++', 'Python', 'Java', 'Kotlin', 'Swift'];

    final listaLinguagens = ListView.builder(
      itemCount: nomes.length,
      itemBuilder: (context, posicao) {
        return Column(
          children: [
            SizedBox(
              height: 56,
              child: Center(child: Text(nomes[posicao], style: const TextStyle(fontSize: 18))),
            ),
            const Divider(height: 1),
          ],
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('responsive - layouts'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: emPe
        
          ? Column(
              children: [
                const SizedBox(height: 16),
                titulo,
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [botaoUm, botaoDois],
                ),
                const SizedBox(height: 16),
                Expanded(child: listaLinguagens),
              ],
            )
          
          : Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      titulo,
                      const SizedBox(height: 16),
                      botaoUm,
                      const SizedBox(height: 16),
                      botaoDois,
                    ],
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(child: listaLinguagens),
              ],
            ),
    );
  }
}
