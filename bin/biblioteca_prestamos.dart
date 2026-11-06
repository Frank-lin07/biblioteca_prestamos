import '../lib/menu.dart';
import 'dart:io';

void main() {
  mostrarMenu();
  String? opcion = stdin.readLineSync();
  ejecutarOpcion(opcion ?? '');
}