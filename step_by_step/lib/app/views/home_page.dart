import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
