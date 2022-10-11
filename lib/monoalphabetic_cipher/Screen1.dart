import 'package:flutter/material.dart';

import 'Affine.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _MyScreen1State createState() => _MyScreen1State();
}

class _MyScreen1State extends State<Screen1> {
  String? msg;
  int? a;
  int? c;
  String msg2 = "";

  var affine = Affine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.lock_outline),
        label: const Text('Crypter'),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            msg2 = affine.crypt(msg!, a!, c!);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              "Crypter",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0),
            ),
            IconButton(
              icon: const Icon(null),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 90.0, 30.0, 0.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Escreva uma mensagem para criptografar",
              ),
              onChanged: (m) => setState(() {
                msg = m;
              }),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: Text(
                "Mensagem : $msg2",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
