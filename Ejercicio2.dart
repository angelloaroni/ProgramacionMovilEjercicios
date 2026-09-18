import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              // NARANJA
              Expanded(
                child: Container(
                  color: Colors.orange,
                ),
              ),

              const SizedBox(height: 5),

              // AZUL + ROJO
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              // ESPACIO VERTICAL
              const SizedBox(height: 5),

              // NARANJA
              Expanded(
                child: Container(
                  color: Colors.orange,
                ),
              ),

              // ESPACIO VERTICAL
              const SizedBox(height: 5),

              // AZUL + ROJO
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),

                    // ESPACIO HORIZONTAL
                    const SizedBox(width: 5),

                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
