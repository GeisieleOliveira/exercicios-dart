import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'exerc 6 - tarefas',
      theme: ThemeData(colorSchemeSeed: Colors.pink, useMaterial3: true),
      home: const TelaTarefas(),
    );
  }
}

class Tarefa {
  String texto;
  bool feita;

  Tarefa(this.texto, {this.feita = false});
}

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final List<Tarefa> _todasTarefas = List.generate(
    5,
    (indice) => Tarefa('Task ${DateTime.now()}'),
  );

  bool _mostrarFeitas = false; 

  void _abrirAviso() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('aviso!!!'),
          content: const Text('vc está no App de notas de tarefas!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Tarefa> tarefasMostradas = [];
    for (final tarefa in _todasTarefas) {
      if (tarefa.feita == _mostrarFeitas) {
        tarefasMostradas.add(tarefa);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _mostrarFeitas = !_mostrarFeitas;
                });
              },
              child: Text(
                _mostrarFeitas ? 'view Uncompleted Tasks' : 'view Completed Tasks',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              _mostrarFeitas
                  ? 'you have ${tarefasMostradas.length} completed tasks'
                  : 'you have ${tarefasMostradas.length} uncompleted tasks',
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: tarefasMostradas.length,
              itemBuilder: (context, posicao) {
                final tarefa = tarefasMostradas[posicao];

                return Card(
                  color: Colors.pink.shade100,
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(tarefa.texto, style: const TextStyle(fontSize: 13)),
                    trailing: Checkbox(
                      value: tarefa.feita,
                      onChanged: (novoValor) {
                        setState(() {
                          tarefa.feita = novoValor!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirAviso,
        child: const Icon(Icons.add),
      ),
    );
  }
}
