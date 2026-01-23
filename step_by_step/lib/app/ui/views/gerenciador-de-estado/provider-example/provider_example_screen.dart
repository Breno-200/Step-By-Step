import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:step_by_step/app/ui/providers/gerenciador-de-estado/provider-example/usuario_controller.dart';

class ProviderExampleScreen extends StatefulWidget {
  const ProviderExampleScreen({super.key});

  @override
  State<ProviderExampleScreen> createState() => _ProviderExampleScreenState();
}

class _ProviderExampleScreenState extends State<ProviderExampleScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<UsuarioController>().listarUsuarios();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black87,
          iconSize: 30,
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(Icons.home),
        ),
        title: Text('Provider'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: viewmodel.users.length,
        itemBuilder: (context, index) {
          final usuario = viewmodel.users[index];
          // viewmodel.carregando

          return ListTile(
            title: Text(usuario.nomeUsuario),
            subtitle: Text(usuario.email),
            leading: CircleAvatar(child: Text('${usuario.id}')),
          );
        },
      ),
    );
  }
}
