import 'package:flutter/material.dart';
import '../data/course_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _cursos = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  // Espera el Future con await y actualiza la pantalla con setState.
  Future<void> _cargarDatos() async {
    final datos = await obtenerCursos();
    setState(() {
      _cursos = datos;
      _cargando = false;
    });
  }

  Color _colorNivel(String nivel) {
    switch (nivel) {
      case 'Básico':
        return Colors.green;
      case 'Intermedio':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Catálogo de Cursos'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _cargando
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Cargando cursos...'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _cursos.length,
              itemBuilder: (context, index) {
                final curso = _cursos[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _colorNivel(curso['nivel']),
                      child: const Icon(Icons.school, color: Colors.white),
                    ),
                    title: Text(
                      curso['nombre'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Docente: ${curso['docente']}\n'
                      'Duración: ${curso['duracion']} horas\n'
                      'Nivel: ${curso['nivel']}',
                    ),
                    isThreeLine: true,
                    trailing: curso['certificado']
                        ? const Icon(Icons.workspace_premium, color: Colors.amber)
                        : null,
                  ),
                );
              },
            ),
    );
  }
}