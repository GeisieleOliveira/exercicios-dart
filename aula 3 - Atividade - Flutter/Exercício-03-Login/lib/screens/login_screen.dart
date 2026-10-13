import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('acesso ao sistema'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SizedBox(height: 24),
          Image.asset('assets/logo.png', height: 110),
          SizedBox(height: 36),
          FormularioLogin(),
          TextButton(
            onPressed: () {},
            child: Text('novo por aqui? criar conta'),
          ),
        ],
      ),
    );
  }
}
