import '../lib/menu.dart';
import 'dart:io';

void main() {
  String opcion = '';

  while (opcion != '0') {
    mostrarMenu();
    opcion = stdin.readLineSync() ?? '';
    ejecutarOpcion(opcion);
  }
}