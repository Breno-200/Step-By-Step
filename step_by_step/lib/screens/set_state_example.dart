import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int _contador = 0;
  bool _menorZero = true;

  void menorZero() {
    _contador == 0 ? _menorZero = true : _menorZero = false;
  }

  void incrementar() {
    setState(() {
      _contador++;
    });
  }

  void decrementar() {
    setState(() {
      _contador--;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Contador'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valor atual:',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              '$_contador',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ?_menorZero
                    ? null
                    : OutlinedButton(
                        onPressed: () {
                          decrementar();
                          menorZero();
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Icon(Icons.remove, size: 30),
                      ),
                const SizedBox(width: 20),

                FilledButton(
                  onPressed: () {
                    incrementar();
                    menorZero();
                  },
                  style: FilledButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.add, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
