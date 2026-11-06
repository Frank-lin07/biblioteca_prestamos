import 'prestamo.dart';
import 'validaciones.dart';

List<Prestamo> prestamos = [];
int siguienteId = 1;

void registrarPrestamo() {
  print('\n--- Registrar préstamo ---');
  String libro = leerTextoNoVacio('Título del libro: ');
  String usuario = leerTextoNoVacio('Nombre del usuario: ');
  String fecha = DateTime.now().toString().substring(0, 10);

  Prestamo nuevo = Prestamo(siguienteId, libro, usuario, fecha);
  prestamos.add(nuevo);
  siguienteId++;

  print('Préstamo registrado con ID ${nuevo.id}.');
}