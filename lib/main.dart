import 'package:cryptographic_algorithms_app/cesar_cyph/cesar_cyph.dart';
import 'package:cryptographic_algorithms_app/home_page.dart';
import 'package:cryptographic_algorithms_app/monoalphabetic_cipher/Screen1.dart';
import 'package:cryptographic_algorithms_app/monoalphabetic_cipher/Screen2.dart';
import 'package:cryptographic_algorithms_app/monoalphabetic_cipher/monoalphabetic_cipher.dart';
import 'package:cryptographic_algorithms_app/polyalphabetic-cipher/decrypt.dart';
import 'package:cryptographic_algorithms_app/polyalphabetic-cipher/encrypt.dart';
import 'package:cryptographic_algorithms_app/polyalphabetic-cipher/polyalphabetic_cipher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/Cesar': ((context) => CaesarCipher()),
        '/Mono': ((context) => Mono()),
        '/Poly': ((context) => Vigenere()),
        '/Poly/Encrypt': ((context) => const Encrypt()),
        '/Poly/Decrypt': (((context) => const Decrypt())),
        '/Mono/Encrypt': ((context) => const Screen1()),
        '/Mono/Decrypt': ((context) => Screen2()),
      },
    );
  }
}
