import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppFlutter());
}

class MiAppFlutter extends StatelessWidget {
  const MiAppFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicio Rotación',
      home: EjercicioRotacionPantalla(),
    );
  }
}

class EjercicioRotacionPantalla extends StatefulWidget {
  const EjercicioRotacionPantalla({super.key});

  @override
  State<EjercicioRotacionPantalla> createState() => _EjercicioRotacionPantallaState();
}

class _EjercicioRotacionPantallaState extends State<EjercicioRotacionPantalla> {
  // Valores iniciales solicitados en el ejercicio de las diapositivas[cite: 2]
  final List<Color> _colors = [
    Colors.amber,
    Colors.blue,
    Colors.deepOrange,
    Colors.green
  ];

  final List<int> _proportions = [1, 2, 3, 4];

  // Lógica para rotar los elementos de las listas y actualizar el estado[cite: 2]
  void _rotarValores() {
    setState(() {
      _colors.insert(0, _colors.removeLast());
      _proportions.insert(0, _proportions.removeLast());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos verticalmente[cite: 1]
            children: [
              // Contenedor principal para las filas y columnas de los cuadros
              SizedBox(
                height: 350,
                child: Column(
                  children: [
                    // Primera Fila
                    Expanded(
                      child: Row(
                        children: [
                          _crearCuadro(_colors[0], _proportions[0]),
                          const SizedBox(width: 8), // Espacio entre cuadros[cite: 1]
                          _crearCuadro(_colors[1], _proportions[1]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8), // Espacio entre las filas[cite: 1]
                    // Segunda Fila
                    Expanded(
                      child: Row(
                        children: [
                          _crearCuadro(_colors[2], _proportions[2]),
                          const SizedBox(width: 8),
                          _crearCuadro(_colors[3], _proportions[3]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Botón de acción para rotar los valores[cite: 2]
              ElevatedButton(
                onPressed: _rotarValores,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade50,
                  foregroundColor: Colors.deepPurple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Rotar valores'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget personalizado para dibujar los cuadros aplicando Expanded y flex[cite: 1]
  Widget _crearCuadro(Color color, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados del ejercicio[cite: 2]
        ),
      ),
    );
  }
}
