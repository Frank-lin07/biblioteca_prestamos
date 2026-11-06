import 'dart:io';

String leerTexto(String mensaje) {
  stdout.write(mensaje);
  String? entrada = stdin.readLineSync();
  return entrada ?? '';
}

String leerTextoNoVacio(String mensaje) {
  String texto = leerTexto(mensaje).trim();

  while (texto.isEmpty) {
    print('Error: este campo no puede estar vacío.');
    texto = leerTexto(mensaje).trim();
  }

  return texto;
}

int leerEnteroPositivo(String mensaje) {
  int? numero = int.tryParse(leerTexto(mensaje).trim());

  while (numero == null || numero <= 0) {
    print('Error: ingrese un número entero mayor que cero.');
    numero = int.tryParse(leerTexto(mensaje).trim());
  }

  return numero;
}