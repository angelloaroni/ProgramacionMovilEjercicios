import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffdcdcdc),
        body: Center(
          child: SizedBox(
            height: 700,
            width: 350,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xfffbf8fd),
                borderRadius: BorderRadius.circular(24),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fila superior: Miniatura + Encabezado + Botón
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildThumbnail(size: 90),
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
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'supporting text',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                width: 75,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: const Color(0xff6750a4),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Fecha y párrafos
                    const Text(
                      'Published date',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna '
                      'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
                      'ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.35,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Duis aute irure dolor in reprehenderit in voluptate velit '
                      'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint '
                      'occaecat cupidatat non proident, sunt in culpa qui officia '
                      'deserunt mollit anim id est laborum.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.35,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Título de sección
                    const Row(
                      children: [
                        Text(
                          'Section title',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.stars_rounded,
                          size: 22,
                          color: Colors.black54,
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Lista inferior
                    _buildListItem(),
                    const SizedBox(height: 12),
                    _buildListItem(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildThumbnail({double size = 80}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xffebe5ed),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(
          Icons.interests_rounded,
          color: Color(0xffcac4d0),
          size: 45,
        ),
      ),
    );
  }

  static Widget _buildListItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildThumbnail(size: 80),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Description duis aute irure dolor in reprehenderit in voluptate velit.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: 17,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Today · 23 min',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.play_arrow,
                    size: 20,
                    color: Colors.black87,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
