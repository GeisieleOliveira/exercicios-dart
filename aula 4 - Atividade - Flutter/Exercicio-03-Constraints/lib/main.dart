import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 3 - Constraints',
      theme: ThemeData(colorSchemeSeed: Colors.pink, useMaterial3: true),
      home: const TelaLista(),
    );
  }
}

class Exemplo {
  final String titulo;
  final String explicacao;
  final Widget widget;

  Exemplo(this.titulo, this.explicacao, this.widget);
}

final List<Exemplo> exemplos = [
  Exemplo(
    'Container rosa simples',
    'O Container não tem filho nem tamanho, então se expande ao máximo permitido. '
        'A tela impõe restrições "tight", logo ele preenche tudo.',
    Container(color: Colors.pink),
  ),
  Exemplo(
    'Container 100x100 direto na tela',
    'A tela força o tamanho exato. O Container pede 100x100, mas é ignorado: '
        'o filho DEVE obedecer às restrições do pai.',
    Container(width: 100, height: 100, color: Colors.pink),
  ),
  Exemplo(
    'Center + Container 100x100',
    'O Center "afrouxa" as restrições (mínimo = 0). Agora o Container pode ter '
        '100x100 e o Center o posiciona no meio.',
    Center(child: Container(width: 100, height: 100, color: Colors.pink)),
  ),
  Exemplo(
    'Align (canto inferior direito) + Container 100x100',
    'O Align também afrouxa as restrições, mas quem define a posição é o pai (Align): '
        'aqui, o canto inferior direito.',
    Align(
      alignment: Alignment.bottomRight,
      child: Container(width: 100, height: 100, color: Colors.pink),
    ),
  ),
  Exemplo(
    'Center + Container infinito',
    'width e height = double.infinity pedem o máximo; o Container recebe o máximo '
        'permitido pelo Center, que é a tela inteira.',
    Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink,
      ),
    ),
  ),
  Exemplo(
    'Center + Container sem tamanho e sem filho',
    'Sem filho e sem tamanho, o Container se expande ao máximo permitido (a tela toda).',
    Center(child: Container(color: Colors.pink)),
  ),
  Exemplo(
    'Center + Container com filho 30x30',
    'Com filho, o Container se ajusta ao tamanho do filho (30x30).',
    Center(
      child: Container(
        color: Colors.pink,
        child: Container(width: 30, height: 30, color: Colors.pink.shade100),
      ),
    ),
  ),
  Exemplo(
    'Container com padding 20 e filho 30x30',
    'O padding soma ao tamanho do filho: 20 + 30 + 20 = 70x70.',
    Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.pink,
        child: Container(width: 30, height: 30, color: Colors.pink.shade100),
      ),
    ),
  ),
  Exemplo(
    'ConstrainedBox direto na tela',
    'As restrições da tela são "tight" e prevalecem sobre as do ConstrainedBox: '
        'o resultado preenche a tela.',
    ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Container(width: 10, height: 10, color: Colors.pink),
    ),
  ),
  Exemplo(
    'Center + ConstrainedBox (filho 10x10)',
    'Restrições: mínimo 70 e máximo 150. O filho pede 10x10, mas o mínimo é 70: '
        'ele fica com 70x70.',
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(width: 10, height: 10, color: Colors.pink),
      ),
    ),
  ),
  Exemplo(
    'Center + ConstrainedBox (filho 1000x1000)',
    'O filho pede 1000x1000, mas o máximo é 150: ele fica com 150x150.',
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(width: 1000, height: 1000, color: Colors.pink),
      ),
    ),
  ),
  Exemplo(
    'Center + ConstrainedBox (filho 100x100)',
    '100 está entre o mínimo (70) e o máximo (150): o filho fica com 100x100.',
    Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(width: 100, height: 100, color: Colors.pink),
      ),
    ),
  ),
  Exemplo(
    'UnconstrainedBox',
    'Remove as restrições do pai: o filho assume o tamanho que quiser (20x50).',
    UnconstrainedBox(
      child: Container(width: 20, height: 50, color: Colors.pink),
    ),
  ),
  Exemplo(
    'Row com overflow',
    'A Row dá largura ilimitada aos filhos, mas a soma (600) é maior que a tela. '
        'O Flutter mostra a faixa amarela e preta de overflow (modo debug).',
    Row(
      children: [
        Container(width: 300, height: 50, color: Colors.pink),
        Container(width: 300, height: 50, color: Colors.pink.shade200),
      ],
    ),
  ),
  Exemplo(
    'Row com Expanded',
    'O Expanded divide o espaço que sobra de acordo com o flex (2 para 1); '
        'o último filho tem largura fixa de 50.',
    Row(
      children: [
        Expanded(flex: 2, child: Container(color: Colors.pink)),
        Expanded(child: Container(color: Colors.pink.shade200)),
        Container(width: 50, color: Colors.pink.shade50),
      ],
    ),
  ),
  Exemplo(
    'column + ListView com Expanded',
    'Solução 1: o Expanded dá ao ListView uma altura finita (o espaço que sobra na Column).',
    Column(
      children: [
        const Text('my name'),
        const Text('my surname'),
        Expanded(
          child: ListView(children: const [Text('Skill 1'), Text('Skill 2')]),
        ),
      ],
    ),
  ),
  Exemplo(
    'column + listView com shrinkWrap',
    'solução 2: shrinkWrap: true reduz o listView ao tamanho do conteúdo '
        '(é mais custoso para o computador).',
    Column(
      children: [
        const Text('My name'),
        const Text('My surname'),
        ListView(
          shrinkWrap: true,
          children: const [Text('Skill 1'), Text('Skill 2')],
        ),
      ],
    ),
  ),
  Exemplo(
    'column + listView com SizedBox',
    'solução 3: o sizedBox com altura fixa dá ao ListView uma altura finita',
    Column(
      children: [
        const Text('My name'),
        const Text('My surname'),
        SizedBox(
          height: 200,
          child: ListView(children: const [Text('Skill 1'), Text('Skill 2')]),
        ),
      ],
    ),
  ),
];

class TelaLista extends StatelessWidget {
  const TelaLista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('layout - constraints'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: exemplos.length,
        itemBuilder: (context, posicao) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink.shade100,
              child: Text('${posicao + 1}'),
            ),
            title: Text(exemplos[posicao].titulo),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaExemplo(numero: posicao + 1, exemplo: exemplos[posicao]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TelaExemplo extends StatelessWidget {
  final int numero;
  final Exemplo exemplo;

  const TelaExemplo({super.key, required this.numero, required this.exemplo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo $numero'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(child: exemplo.widget),
          Container(
            width: double.infinity,
            color: Colors.pink.shade50,
            padding: const EdgeInsets.all(16),
            child: Text(
              '${exemplo.titulo}\n\n${exemplo.explicacao}',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
