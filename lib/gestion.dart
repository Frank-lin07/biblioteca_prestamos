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

void buscarPorLibro() {
  String texto = leerTextoNoVacio('Título del libro a buscar: ').toLowerCase();
  bool encontrado = false;

  for (Prestamo p in prestamos) {
    if (p.libro.toLowerCase().contains(texto)) {
      p.mostrarInformacion();
      encontrado = true;
    }
  }

  if (!encontrado) {
    print('No se encontraron préstamos para ese libro.');
  }
}

void buscarPrestamo() {
  print('\n--- Buscar préstamo ---');
  print('1. Por nombre de usuario');
  print('2. Por título de libro');
  String opcion = leerTexto('Seleccione una opción: ').trim();

  switch (opcion) {
    case '1':
      buscarPorUsuario();
      break;
    case '2':
      buscarPorLibro();
      break;
    default:
      print('Opción no válida.');
  }
}

Prestamo? buscarPorId(int id) {
  for (Prestamo p in prestamos) {
    if (p.id == id) {
      return p;
    }
  }
  return null;
}

void modificarPrestamo() {
  print('\n--- Modificar préstamo ---');
  print('1. Cambiar nombre del usuario');
  print('2. Marcar como devuelto');
  String opcion = leerTexto('Seleccione una opción: ').trim();

  switch (opcion) {
    case '1':
      cambiarUsuario();
      break;
    case '2':
      devolverPrestamo();
      break;
    default:
      print('Opción no válida.');
  }
}

void cambiarUsuario() {
  if (prestamos.isEmpty) {
    print('No hay préstamos registrados.');
    return;
  }

  int id = leerEnteroPositivo('ID del préstamo a modificar: ');
  Prestamo? prestamo = buscarPorId(id);

  if (prestamo == null) {
    print('No existe un préstamo con ese ID.');
    return;
  }

  prestamo.mostrarInformacion();
  String nuevoUsuario = leerTextoNoVacio('Nuevo nombre del usuario: ');

  prestamo.usuario = nuevoUsuario;
  print('Préstamo actualizado.');
}

void devolverPrestamo() {
  print('\n--- Devolver libro ---');

  int id = leerEnteroPositivo('ID del préstamo a devolver: ');
  Prestamo? prestamo = buscarPorId(id);

  if (prestamo == null) {
    print('No existe un préstamo con ese ID.');
    return;
  }

  if (prestamo.devuelto) {
    print('Ese préstamo ya fue devuelto.');
    return;
  }

  prestamo.devuelto = true;
  librosPrestados.remove(prestamo.libro.toLowerCase());
  print('Libro devuelto. Ya puede prestarse de nuevo.');
}

void eliminarPrestamo() {
  print('\n--- Eliminar préstamo ---');

  if (prestamos.isEmpty) {
    print('No hay préstamos registrados.');
    return;
  }

  int id = leerEnteroPositivo('ID del préstamo a eliminar: ');
  Prestamo? prestamo = buscarPorId(id);

  if (prestamo == null) {
    print('No existe un préstamo con ese ID.');
    return;
  }

  prestamo.mostrarInformacion();
  String confirmacion =
      leerTexto('¿Seguro que desea eliminarlo? (s/n): ').trim().toLowerCase();

  if (confirmacion != 's') {
    print('Eliminación cancelada.');
    return;
  }

  if (!prestamo.devuelto) {
    librosPrestados.remove(prestamo.libro.toLowerCase());
  }
  prestamos.remove(prestamo);
  print('Préstamo eliminado.');
}