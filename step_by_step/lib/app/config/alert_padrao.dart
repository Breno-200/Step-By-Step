import 'package:flutter/material.dart';

class AlertPadrao {
  
  static void message(
    BuildContext context, {
    required String titulo,
    required String mensagem,
    String textoBotao = 'OK',
    VoidCallback? aoConfirmar,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                if (aoConfirmar != null) aoConfirmar();
              },
              child: Text(textoBotao),
            ),
          ],
        );
      },
    );
  }
}
