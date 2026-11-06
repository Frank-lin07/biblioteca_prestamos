import 'prestamo.dart';
import 'validaciones.dart';

List<Prestamo> prestamos = [];
Set<String> librosPrestados = {};
int siguienteId = 1;

void registrarPrestamo() {
  print('\n--- Registrar préstamo ---');
  String libro = leerTextoNoVacio('Título del libro: ');
  String clave = libro.toLowerCase();

  if (librosPrestados.contains(clave)) {
    print('Error: ese libro ya está prestado actualmente.');
    return;
  }

  String usuario = leerTextoNoVacio('Nombre del usuario: ');
  String fecha = DateTime.now().toString().substring(0, 10);

  Prestamo nuevo = Prestamo(siguienteId, libro, usuario, fecha);
  prestamos.add(nuevo);
  librosPrestados.add(clave);
  siguienteId++;

  print('Préstamo registrado con ID ${nuevo.id}.');
}

void consultarTodos() {
  print('\n--- Lista de préstamos ---');

  if (prestamos.isEmpty) {
    print('No hay préstamos registrados.');
    return;
  }

  for (Prestamo p in prestamos) {
    p.mostrarInformacion();
  }
}

void buscarPorUsuario() {
  String texto = leerTextoNoVacio('Nombre del usuario a buscar: ').toLowerCase();
  bool encontrado = false;

  for (Prestamo p in prestamos) {
    if (p.usuario.toLowerCase().contains(texto)) {
      p.mostrarInformacion();
      encontrado = true;
    }
  }

  if (!encontrado) {
    print('No se encontraron préstamos para ese usuario.');
  }
}