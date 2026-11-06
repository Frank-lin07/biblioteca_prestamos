# Sistema de gestión de préstamos de una biblioteca

Aplicación de consola en Dart para administrar los préstamos de libros
de una biblioteca. Proyecto del Momento Evaluativo 1 – Lenguaje de
Programación para APPs (UCC).

**Estudiante:** Franklin Grisales Castrillon

## Funcionalidades

1. Registrar un préstamo
2. Consultar todos los préstamos
3. Buscar por usuario o por libro
4. Modificar (cambiar usuario o marcar como devuelto)
5. Eliminar un préstamo
6. Mostrar resumen
0. Salir

## Estructura del proyecto

- `bin/biblioteca_prestamos.dart`: punto de entrada, ciclo del menú.
- `lib/menu.dart`: menú principal con `switch`.
- `lib/gestion.dart`: operaciones del sistema.
- `lib/validaciones.dart`: lectura y validación de datos.
- `lib/prestamo.dart`: clase `Prestamo`.

## Estructuras de datos usadas

- **List:** `List<Prestamo> prestamos` guarda todos los préstamos
  registrados. Usé una lista porque puede crecer, mantiene el orden y
  se recorre fácil con `for`.
- **Set:** `Set<String> librosPrestados` guarda los títulos de los
  libros que están prestados ahora. Usé un Set porque no permite
  repetidos, así evito prestar el mismo libro dos veces.
- **Map:** `Map<String, int>` en el resumen guarda cuántos préstamos
  tiene cada usuario (clave: nombre, valor: cantidad).

## Ejecución

```
dart run
```

## Investigación: clases y objetos

### ¿Qué es una clase?
Es un molde que describe cómo es algo y qué datos y acciones tiene.
En mi proyecto, la clase `Prestamo` describe qué información tiene un
préstamo de la biblioteca.

### ¿Qué es un objeto?
Es algo concreto creado a partir de una clase. Cuando registro que Ana
pidió prestado "Don Quijote", se crea un objeto `Prestamo` en memoria
con esos datos.

### ¿Diferencia entre clase y objeto?
La clase es el molde y el objeto es lo que se hace con ese molde. Hay
una sola clase `Prestamo`, pero puede haber muchos objetos, uno por
cada préstamo registrado.

### ¿Qué es un atributo?
Es un dato que guarda el objeto. En `Prestamo` los atributos son `id`,
`libro`, `usuario`, `fechaPrestamo` y `devuelto`.

### ¿Qué es un método?
Es una acción que sabe hacer el objeto. El método `mostrarInformacion()`
imprime en consola los datos del préstamo. Se diferencia de un atributo
en que el atributo guarda información y el método realiza algo.

### ¿Para qué sirve un constructor?
Sirve para crear un objeto y darle sus valores iniciales al mismo
tiempo. Sin constructor tendría que crear el préstamo vacío y asignar
cada dato por separado.

## Aplicación en el proyecto

La clase es `Prestamo` (archivo `lib/prestamo.dart`). Sus atributos son
`id`, `libro`, `usuario`, `fechaPrestamo` y `devuelto`. Su constructor
es `Prestamo(this.id, this.libro, this.usuario, this.fechaPrestamo,
{this.devuelto = false})`; el atributo `devuelto` empieza en `false`
porque un préstamo nuevo todavía no se ha devuelto.

En la función `registrarPrestamo` (`lib/gestion.dart`) se crea el
objeto `Prestamo nuevo = Prestamo(siguienteId, libro, usuario, fecha);`
y se agrega a la lista. El método `mostrarInformacion()` imprime una
línea con el ID, el libro, el usuario, la fecha y si está activo o
devuelto; lo uso al consultar, buscar, modificar y eliminar.