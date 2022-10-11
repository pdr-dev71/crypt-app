// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  elevation: 6,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    color: Colors.white,
                    width: screenWith * .9,
                    height: screenHeight * .8,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          width: screenWith,
                          height: screenHeight * .1,
                          child: const Center(
                            child: Text(
                              'Escolha um algoritmo de criptografia:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  width: screenWith * .8,
                                  height: screenHeight * .1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder()),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/Cesar');
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.lockOpen,
                                          size: 28,
                                        ),
                                        SizedBox(width: 18),
                                        Text(
                                          'Cesar',
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SizedBox(
                                  width: screenWith * .8,
                                  height: screenHeight * .1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder()),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/Mono');
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.shieldHalved,
                                          size: 28,
                                        ),
                                        SizedBox(width: 18),
                                        Text(
                                          'Monoalfabetica',
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SizedBox(
                                  width: screenWith * .8,
                                  height: screenHeight * .1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder()),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/Poly');
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.shield,
                                          size: 28,
                                        ),
                                        SizedBox(width: 18),
                                        Text(
                                          'Polialfabetica',
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
