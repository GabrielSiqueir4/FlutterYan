import 'package:atividade01/COMPONENTS/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GaleriaPage extends StatelessWidget {
  static const _actionTitles = [
    'A Foto Foi Salva na Galeria!',
    '',
    'Upload Video'
  ];
  final String imagePath;

  const GaleriaPage(this.imagePath);

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  
}
