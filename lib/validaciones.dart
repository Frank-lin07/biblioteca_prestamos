import 'dart:io';

String leerTexto(String mensaje) {
  stdout.write(mensaje);
  String? entrada = stdin.readLineSync();
  return entrada ?? '';
}

int? leerEntero(String mensaje) {
  String texto = leerTexto(mensaje);
  return int.tryParse(texto);
}