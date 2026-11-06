import 'dart:io';
import 'gestion.dart';

void mostrarMenu() {
  print('\nSISTEMA DE GESTIÓN DE PRÉSTAMOS');
  print('-----------------------------');
  print('1. Registrar');
  print('2. Consultar todos');
  print('3. Buscar');
  print('4. Modificar');
  print('5. Eliminar');
  print('6. Mostrar resumen');
  print('0. Salir');
  print('-----------------------------');
  stdout.write('Seleccione una opción: ');
}

void ejecutarOpcion(String opcion) {
  switch (opcion) {
    case '1':
      registrarPrestamo();
      break;
    case '2':
      consultarTodos();
      break;
    case '3':
      buscarPrestamo();
      break;
    case '4':
      print('Modificar (pendiente)');
      break;
    case '5':
      print('Eliminar (pendiente)');
      break;
    case '6':
      print('Mostrar resumen (pendiente)');
      break;
    case '0':
      print('Hasta pronto.');
      break;
    default:
      print('Opción no válida. Intente de nuevo.');
  }
}