import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 5 - BottomAppBar + FAB',
      theme: ThemeData(colorSchemeSeed: Colors.pink, useMaterial3: true),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _abaAtual = 0; 
  bool _menuAberto = false; 

  void _avisar(String texto) {
    setState(() {
      _menuAberto = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  Widget _criarItem(int numero, IconData icone, String texto) {
    Color cor = Colors.grey;
    if (_abaAtual == numero) {
      cor = Colors.pink;
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _abaAtual = numero;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, color: cor),
            Text(texto, style: TextStyle(fontSize: 11, color: cor)),
          ],
        ),
      ),
    );
  }

  Widget _criarOpcao(IconData icone, String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: FloatingActionButton.small(
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
        onPressed: () => _avisar(texto),
        child: Icon(icone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bottomAppBar with FAB'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Center(
            child: Text('TAB: $_abaAtual', style: const TextStyle(fontSize: 32)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_menuAberto) _criarOpcao(Icons.chat, 'Mensagem'),
                  if (_menuAberto) _criarOpcao(Icons.email, 'E-mail'),
                  if (_menuAberto) _criarOpcao(Icons.phone, 'Ligação'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _menuAberto = !_menuAberto;
          });
        },
        child: Icon(_menuAberto ? Icons.close : Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          children: [
            _criarItem(0, Icons.menu, 'This'),
            _criarItem(1, Icons.layers, 'Is'),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('A', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            _criarItem(2, Icons.dashboard, 'Bottom'),
            _criarItem(3, Icons.info, 'Bar'),
          ],
        ),
      ),
    );
  }
}
