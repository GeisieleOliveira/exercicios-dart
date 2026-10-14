import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class Foto {
  final String cidade;
  final String legenda;
  final String url;

  Foto(this.cidade, this.legenda, this.url);
}

final List<Foto> fotos = [
  Foto('Galeria', 'Foto 1', 'https://picsum.photos/seed/rosa1/400/400'),
  Foto('Galeria', 'Foto 2', 'https://picsum.photos/seed/rosa2/400/400'),
  Foto('Galeria', 'Foto 3', 'https://picsum.photos/seed/rosa3/400/400'),
  Foto('Galeria', 'Foto 4', 'https://picsum.photos/seed/rosa4/400/400'),
  Foto('Galeria', 'Foto 5', 'https://picsum.photos/seed/rosa5/400/400'),
  Foto('Galeria', 'Foto 6', 'https://picsum.photos/seed/rosa6/400/400'),
];

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'exerc 1 - gridview',
      theme: ThemeData(colorSchemeSeed: Colors.pink, useMaterial3: true),
      home: const TelaGaleria(),
    );
  }
}

class TelaGaleria extends StatelessWidget {
  const TelaGaleria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('galeria'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: fotos.length,
        itemBuilder: (context, posicao) {
          final foto = fotos[posicao];
          
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(foto.url, fit: BoxFit.cover),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black45,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${foto.cidade}\n${foto.legenda}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
