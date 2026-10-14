import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'exerc 4 - form',
      theme: ThemeData(colorSchemeSeed: Colors.pink, useMaterial3: true),
      home: const TelaFormulario(),
    );
  }
}

class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorData = TextEditingController();

  @override
  void dispose() {
    _controladorNome.dispose();
    _controladorTelefone.dispose();
    _controladorData.dispose();
    super.dispose();
  }

  Future<void> _escolherData() async {
    final DateTime? escolhida = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (escolhida != null) {
      setState(() {
        _controladorData.text = '${escolhida.day}/${escolhida.month}/${escolhida.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter form demo'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _chaveForm,
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.person, color: Colors.pink),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _controladorNome,
                      decoration: const InputDecoration(hintText: 'Name'),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'entre com o nome';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.pink),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _controladorTelefone,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(hintText: 'Phone'),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'entre com o telefone';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.pink),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _controladorData,
                      readOnly: true, 
                      onTap: _escolherData,
                      decoration: const InputDecoration(hintText: 'Dob'),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'escolha a data';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_chaveForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Nome: ${_controladorNome.text}\n'
                          'Telefone: ${_controladorTelefone.text}\n'
                          'Dob: ${_controladorData.text}',
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
