import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFF5117),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 25),
                      Icon(
                        Icons.menu,
                        size: 36,
                        color: Colors.white,
                      ),
                      SizedBox(width: 110),
                      Icon(
                        Icons.menu,
                        size: 36,
                        color: Colors.white,
                      ),
                      SizedBox(width: 100),
                      Icon(
                        Icons.menu,
                        size: 36,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 18,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.purple,
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ARQUITECTURA DE SOFTWARE',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Seccion: 1052',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xff3fd5ef),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AUDITORÍA Y CONTROL DE SISTEMAS',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Seccion: 853',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xffec5d1c),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ING.SOFT II',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Seccion: 851',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xff51ff4b),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PROG. MÓVIL',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Seccion: 856',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xff165cb9),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PROP. INVESTIGACIÓN',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Seccion: 852',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Color(0xffefba46),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SIST. ERP',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'Seccion: 854',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 36,
                        ),
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 36,
                        ),
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 36,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
