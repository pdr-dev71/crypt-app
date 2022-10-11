import 'package:flutter/material.dart';

import 'Affine.dart';

class Screen2 extends StatefulWidget {
  @override
  _MyScreen2State createState() => _MyScreen2State();
}

class _MyScreen2State extends State<Screen2> {
  String? msg;
  int? a;
  int? b;
  String msg2 = "";

  var affine = Affine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.lock_open),
        label: const Text('Decrypter'),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            msg2 = affine.decript(msg!, affine.inversMod(a!, 26), b!);
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
              "Decrypter",
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
                labelText: "Digite a mensagem para descrptografar",
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
