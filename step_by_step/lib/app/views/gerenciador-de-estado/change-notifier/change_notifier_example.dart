import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:step_by_step/app/config/alert_padrao.dart';
import 'package:step_by_step/app/view_model/gerenciador-de-estado/change-notifier/change_notifier_example_controller.dart';

class ChangeNotifierExample extends StatefulWidget {
  const ChangeNotifierExample({super.key});

  @override
  State<ChangeNotifierExample> createState() => _ChangeNotifierExampleState();
}

class _ChangeNotifierExampleState extends State<ChangeNotifierExample> {
  final TextEditingController _nomeController = TextEditingController();
  final ChangeNotifierExampleController _changeNotifierExampleController =
      ChangeNotifierExampleController();

  @override
  void initState() {
    _changeNotifierExampleController.addListener(() {
      setState(() {});
    });
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
            context.go('/home');
          },
          icon: Icon(Icons.home),
        ),
      ),
      body: Stack(
        children: [
          _changeNotifierExampleController.nome.isEmpty
              ? Center(child: Text('Nenhum nome Cadastrado'))
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: _changeNotifierExampleController.nome.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        _changeNotifierExampleController.nome[index][0],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        _changeNotifierExampleController.removerNome(
                          nome: _changeNotifierExampleController.nome[index],
                        );
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red.shade300,
                    ),
                    title: Text(_changeNotifierExampleController.nome[index]),
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
                        if (_nomeController.text.isEmpty) {
                          AlertPadrao.message(
                            context,
                            titulo: 'Campo Vazio',
                            mensagem: 'O campo deve conter algum valor!',
                          );
                          debugPrint('Campo vazio!!');
                        } else {
                          _changeNotifierExampleController.adicionarNome(
                            nome: _nomeController.text,
                          );
                        }
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
