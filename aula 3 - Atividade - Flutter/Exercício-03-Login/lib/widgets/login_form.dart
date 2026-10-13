import 'package:flutter/material.dart';

import '../models/login.dart';
import '../screens/home_screen.dart';

class FormularioLogin extends StatefulWidget {
  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final _controladorUsuario = TextEditingController();
  final _controladorSenha = TextEditingController();

  @override
  void dispose() {
    _controladorUsuario.dispose();
    _controladorSenha.dispose();
    super.dispose();
  }

  void _entrar() {
    Login login = Login(
      usuario: _controladorUsuario.text,
      senha: _controladorSenha.text,
    );

    if (login.autenticar()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaHome()),
      );
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('falha no login: usuário ou senha inválidos'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controladorUsuario,
          decoration: InputDecoration(
            labelText: 'Usuário',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 14),
        TextField(
          controller: _controladorSenha,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Senha',
            border: OutlineInputBorder(),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('esqueci minha senhs'),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _entrar,
            child: Text('Entrar'),
          ),
        ),
      ],
    );
  }
}
