import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
    _contador = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Contador'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          color: Colors.black87,
          iconSize: 30,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog.adaptive(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,

                title: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.orange.shade800,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Deseja Voltar?',
                        style: GoogleFonts.workSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),

                content: Text(
                  'Você irá perder a contagem do seu contador! Esta ação não pode ser desfeita.',
                  style: GoogleFonts.workSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.5, 
                  ),
                ),

                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancelar',
                      style: GoogleFonts.workSans(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => context.go('/home'),
                    child: Text(
                      'Sim, sair',
                      style: GoogleFonts.workSans(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          },
          icon: Icon(Icons.home),
        ),
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
