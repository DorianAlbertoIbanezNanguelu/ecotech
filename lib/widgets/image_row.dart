import 'package:flutter/material.dart';

import 'image_description.dart';

class ImageRow extends StatelessWidget {
  const ImageRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          // Con esta propiedad modificamos la forma de nuestro card
          // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          // Con esta propiedad agregamos margen a nuestro Card
          // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
          margin: const EdgeInsets.all(5),

          // Con esta propiedad agregamos elevación a nuestro card
          // La sombra que tiene el Card aumentará
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ImageDescription(
                                    'assets/images/firebase_logo.png',
                                    'Logo Firebase'),
                              ),
                            );
                          },
                          child: Container(
                            width: 80,
                            height: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/firebase_logo.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B2.png', 'Logo'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/B2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B2.png', 'Logo'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/B2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B5.png', 'Logo'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/B1.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B2.png', 'Perro'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/B2.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B2.png', 'Perro'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/B2.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Card(
          // Con esta propiedad modificamos la forma de nuestro card
          // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          // Con esta propiedad agregamos margen a nuestro Card
          // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
          margin: const EdgeInsets.all(5),

          // Con esta propiedad agregamos elevación a nuestro card
          // La sombra que tiene el Card aumentará
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B2.png', 'Logo'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/B2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B3.png', 'Logo'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/B3.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B4.png', 'Perro'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/B4.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B2.png', 'Logo'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/B2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B2.png', 'Logo'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/B2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageDescription(
                                  'assets/images/B1.png', 'Perro'),
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/B1.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
