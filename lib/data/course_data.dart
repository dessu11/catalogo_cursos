// Colección tipada: lista de mapas con clave String y valor dinámico.
// Uso int para duración (horas) y bool para "certificado",
// en lugar de guardar todo como texto.
final List<Map<String, dynamic>> listaCursos = [
  {
    'nombre': 'Introducción a Dart',
    'docente': 'Laura Gómez',
    'duracion': 20,
    'nivel': 'Básico',
    'certificado': true,
  },
  {
    'nombre': 'Flutter desde cero',
    'docente': 'Carlos Rincón',
    'duracion': 40,
    'nivel': 'Intermedio',
    'certificado': true,
  },
  {
    'nombre': 'Bases de datos con SQLite',
    'docente': 'Andrea Molina',
    'duracion': 30,
    'nivel': 'Intermedio',
    'certificado': false,
  },
  {
    'nombre': 'Arquitectura de apps móviles',
    'docente': 'Julián Torres',
    'duracion': 50,
    'nivel': 'Avanzado',
    'certificado': true,
  },
  {
    'nombre': 'Diseño de interfaces UX/UI',
    'docente': 'Marcela Vargas',
    'duracion': 25,
    'nivel': 'Básico',
    'certificado': false,
  },
];

// Función asíncrona que simula una consulta remota.
// Retorna un Future que se completa tras 2 segundos con la lista.
Future<List<Map<String, dynamic>>> obtenerCursos() async {
  await Future.delayed(const Duration(seconds: 2));
  return listaCursos;
}