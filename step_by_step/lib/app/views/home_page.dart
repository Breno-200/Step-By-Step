import 'package:flutter/material.dart';

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
            children: [CardEstudos(), CardEstudos()],
          ),
        ),
      ),
    );
  }
}

class CardEstudos extends StatelessWidget {
  const CardEstudos({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.greenAccent,
        elevation: 2,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: []),
        ),
      ),
    );
  }
}
