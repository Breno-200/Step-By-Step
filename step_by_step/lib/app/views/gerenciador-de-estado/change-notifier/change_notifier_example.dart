import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChangeNotifierExample extends StatefulWidget {
  const ChangeNotifierExample({super.key});

  @override
  State<ChangeNotifierExample> createState() => _ChangeNotifierExampleState();
}

class _ChangeNotifierExampleState extends State<ChangeNotifierExample> {
  late final TextEditingController _nomeController;

  @override
  void initState() {
    _nomeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifier'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          color: Colors.black87,
          iconSize: 30,
          onPressed: () {
            context.go('home');
          },
          icon: Icon(Icons.home),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(child: Text(index.toString())),
              title: Text('Contato $index'),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .03),
                    offset: const Offset(0, -5),
                    blurRadius: 4,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                          hintText: 'Digite um nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _nomeController.clear();
                      },
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Center(
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
