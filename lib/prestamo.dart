class Prestamo {
  int id;
  String libro;
  String usuario;
  String fechaPrestamo;
  bool devuelto;

  Prestamo(this.id, this.libro, this.usuario, this.fechaPrestamo,
      {this.devuelto = false});

        void mostrarInformacion() {
    String estado = devuelto ? 'Devuelto' : 'Activo';
    print('[$id] $libro | Usuario: $usuario | Fecha: $fechaPrestamo | $estado');
  }
  
}