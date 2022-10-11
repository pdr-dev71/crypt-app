import 'package:flutter/material.dart';

class Mono extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Mono/Encrypt');
                        },
                        child: SizedBox(
                          width: screenWith * .9,
                          height: screenHeight * .4,
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: screenWith * .9,
                                  height: screenHeight * .3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/encrypt.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Column(children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      color: Colors.black,
                                      width: screenWith,
                                      height: screenHeight * .0584,
                                      child: const Center(
                                        child: Text(
                                          'Encriptar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Mono/Decrypt');
                        },
                        child: SizedBox(
                          width: screenWith * .9,
                          height: screenHeight * .4,
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: screenWith * .9,
                                  height: screenHeight * .3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/decrypt.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Column(children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      color: Colors.black,
                                      width: screenWith,
                                      height: screenHeight * .0584,
                                      child: const Center(
                                        child: Text(
                                          'Desencriptar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
