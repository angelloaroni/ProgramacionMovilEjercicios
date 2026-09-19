import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ============================================================================
// 1. INHERITED WIDGET (Propagación eficiente de temas/datos hacia abajo)
// ============================================================================
class AppConfigInherited extends InheritedWidget {
  final String appTitle;
  final Color primaryColor;

  const AppConfigInherited({
    super.key,
    required this.appTitle,
    required this.primaryColor,
    required super.child,
  });

  // Método de conveniencia para acceder a los datos desde cualquier hijo
  static AppConfigInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfigInherited>();
  }

  @override
  bool updateShouldNotify(AppConfigInherited oldWidget) {
    return appTitle != oldWidget.appTitle ||
        primaryColor != oldWidget.primaryColor;
  }
}

// ============================================================================
// WIDGET RAÍZ
// ============================================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConfigInherited(
      appTitle: 'Programación Móvil - Semana 3',
      primaryColor: const Color(0xFF6750A4),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainTabScreen(),
      ),
    );
  }
}

// ============================================================================
// 2. STATELESS WIDGET & CONTROL DE NAVEGACIÓN
// ============================================================================
class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lectura de datos desde el InheritedWidget
    final config = AppConfigInherited.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text(config?.appTitle ?? 'Widgets Demo'),
          backgroundColor: config?.primaryColor ?? Colors.deepPurple,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.grid_view_rounded), text: 'Rotación Flex'),
              Tab(icon: Icon(Icons.article_outlined), text: 'Layout Sem 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RotatingFlexExercise(), // Tab 1: Ejercicio de transferencia P2
            ArticleLayoutExercise(), // Tab 2: Ejercicio de transferencia P1
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 3. STATEFUL WIDGET: Ejercicio Transferencia P2 (Expanded, Flex, Rotación)
// ============================================================================
class RotatingFlexExercise extends StatefulWidget {
  const RotatingFlexExercise({super.key});

  @override
  State<RotatingFlexExercise> createState() => _RotatingFlexExerciseState();
}

class _RotatingFlexExerciseState extends State<RotatingFlexExercise> {
  // Lista de colores y proporciones definidas en la diapositiva
  final List<Color> _colors = [
    Colors.amber,
    Colors.blue,
    Colors.deepOrange,
    Colors.green,
  ];

  final List<int> _proportions = [1, 2, 3, 4];

  // Función para desplazar cíclicamente los elementos
  void _rotateValues() {
    setState(() {
      final lastColor = _colors.removeLast();
      _colors.insert(0, lastColor);

      final lastProp = _proportions.removeLast();
      _proportions.insert(0, lastProp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Spacer flexible en la parte superior
            const Spacer(flex: 1),

            // Cuadrícula dinámica interactiva 2x2 basada en flex
            SizedBox(
              height: 320,
              child: Column(
                children: [
                  // Fila Superior
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: _proportions[3],
                          child: _ColoredCard(
                            color: _colors[3],
                            label: 'Flex: ${_proportions[3]}',
                            onTap: _rotateValues,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: _proportions[0],
                          child: _ColoredCard(
                            color: _colors[0],
                            label: 'Flex: ${_proportions[0]}',
                            onTap: _rotateValues,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Fila Inferior
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: _proportions[1],
                          child: _ColoredCard(
                            color: _colors[1],
                            label: 'Flex: ${_proportions[1]}',
                            onTap: _rotateValues,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: _proportions[2],
                          child: _ColoredCard(
                            color: _colors[2],
                            label: 'Flex: ${_proportions[2]}',
                            onTap: _rotateValues,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Botón interactivo ElevatedButton
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF1EDF9),
                foregroundColor: const Color(0xFF5B4594),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                elevation: 0,
              ),
              onPressed: _rotateValues,
              child: const Text(
                'Rotar valores',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            // Spacer inferior para mantener equilibrado el diseño
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar demostrando GestureDetector + Container + BorderRadius
class _ColoredCard extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _ColoredCard({
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Cumple con el uso de GestureDetector
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0), // Borde 8.0 requerido
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 4. LAYOUT COMPLETO: Ejercicio Transferencia P1 (Columnas, Filas, Jerarquía)
// ============================================================================
class ArticleLayoutExercise extends StatelessWidget {
  const ArticleLayoutExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        // Encabezado con imagen ilustrativa y texto
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder de imagen
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFECE6F0),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                Icons.widgets_outlined,
                size: 48,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Headline',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'supporting text',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Botón decorativo
                  Container(
                    width: 80,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5B4594),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Metadatos
        Text(
          'Published date',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),

        // Cuerpo del texto
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
              'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim '
              'ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut '
              'aliquip ex ea commodo consequat.',
          style: TextStyle(fontSize: 14, height: 1.4),
        ),
        const SizedBox(height: 12),
        const Text(
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '
              'dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat '
              'non proident, sunt in culpa qui officia deserunt mollit anim id est '
              'laborum.',
          style: TextStyle(fontSize: 14, height: 1.4),
        ),

        const SizedBox(height: 28),

        // Título de sección con icono
        Row(
          children: const [
            Text(
              'Section title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Icon(Icons.stars, color: Color(0xFF5B4594), size: 22),
          ],
        ),

        const SizedBox(height: 16),

        // Lista de tarjetas tipo fila multimedia
        const _MediaItemRow(),
        const SizedBox(height: 16),
        const _MediaItemRow(),
      ],
    );
  }
}

// Componente fila reutilizable para la lista inferior
class _MediaItemRow extends StatelessWidget {
  const _MediaItemRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: const Color(0xFFECE6F0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.auto_awesome,
            color: Colors.grey.shade500,
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Description duis aute irure dolor in reprehenderit in voluptate velit.',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.add_circle_outline, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    'Today • 23 min',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                  const Spacer(),
                  const Icon(Icons.play_arrow, size: 22),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
