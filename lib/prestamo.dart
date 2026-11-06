class Prestamo {
  int id;
  String libro;
  String usuario;
  String fechaPrestamo;
  bool devuelto;

  Prestamo(this.id, this.libro, this.usuario, this.fechaPrestamo,
      {this.devuelto = false});
}