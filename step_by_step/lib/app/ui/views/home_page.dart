import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_by_step/app/data/models/usuario/usuario_model.dart';
import 'package:step_by_step/app/data/repositories/usuario/usuario_repository_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final usuarioApi = UsuarioRepositoryImpl();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(maxRadius: 30, child: Icon(Icons.person)),
                  Text(
                    'Breno Alves',
                    style: GoogleFonts.workSans(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'brenoteste@gmail.com',
                    style: GoogleFonts.workSans(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(Icons.person),
              onTap: () async {
                final listaUsers = await usuarioApi.getUsers();
                debugPrint('Dados vindo da API : ${listaUsers.toList()}');
              }, // TODO: Adicionar pagina perfil
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors
              .white, // TODO: Adicionar Troca de tema e padronização de temas
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              CardEstudos(
                titulo: 'SetState',
                subtitulo: 'Mini Projeto para demostrar como funciona.',
                icone: Icons.sync,
                onTap: () {
                  debugPrint('Indo para Pág SetState!');
                  context.go('/state');
                },
              ),
              CardEstudos(
                titulo: 'ChangeNotifier',
                subtitulo:
                    'Praticando gerenciamento de estados com change notifier',
                icone: Icons.sync,
                onTap: () {
                  debugPrint('Indo para Pág ChangeNotifier');
                  context.go('/change-notifier');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardEstudos extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icone;
  final VoidCallback onTap;
  final Color cor;

  const CardEstudos({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.icone,
    required this.onTap,
    this.cor = Colors.greenAccent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: cor,
        elevation: 2,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icone, size: 30, color: Colors.black87),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black54,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                subtitulo,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
