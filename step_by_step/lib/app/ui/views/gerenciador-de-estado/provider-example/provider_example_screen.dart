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
      if (!mounted) return;
      context.read<UsuarioController>().listarUsuarios();
    });
    super.initState();
  }

  TextEditingController formCriarUser = TextEditingController();
  TextEditingController? nomeCompleto;
  TextEditingController? nomeUsuario;
  TextEditingController? email;
  TextEditingController? senha;
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
      body: viewmodel.carregando
          ? Center(child: CircularProgressIndicator.adaptive())
          : viewmodel.errorMensagem != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewmodel.errorMensagem.toString()),
                  TextButton(
                    onPressed: () {
                      context.read<UsuarioController>().listarUsuarios();
                    },
                    child: Text('Tentar Novamente'),
                  ),
                ],
              ),
            )
          : RefreshIndicator.adaptive(
              onRefresh: () async {
                if (!mounted) return;
                await context.read<UsuarioController>().listarUsuarios();
              },
              child: ListView.builder(
                itemCount: viewmodel.users.length,
                itemBuilder: (context, index) {
                  final usuario = viewmodel.users[index];
                  return ListTile(
                    title: Text(usuario.nomeUsuario),
                    subtitle: Text(usuario.email),
                    leading: CircleAvatar(child: Text('${usuario.id}')),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: [
                        TextFormField(
                          // TODO: fazer o modal para criar usuario
                          controller: nomeCompleto,
                          decoration: InputDecoration(
                            labelText: 'Nome Completo',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        TextFormField(controller: nomeUsuario),
                        TextFormField(controller: email),
                        TextFormField(controller: senha),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
