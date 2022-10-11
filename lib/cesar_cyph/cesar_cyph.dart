// ignore_for_file: sized_box_for_whitespace

import 'package:cryptographic_algorithms_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class CaesarCipher extends StatefulWidget {
  const CaesarCipher({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CaesarCipherState createState() => _CaesarCipherState();
}

class _CaesarCipherState extends State<CaesarCipher> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();
  String _result = "";

  @override
  void dispose() {
    _wordController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Cifra de Cesar'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWith * .9,
            height: screenHeight * .85,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        width: screenWith * .8,
                        height: screenHeight * .3,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            "assets/images/cesar.png",
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormFieldWidget(
                        labelText: 'Texto',
                        hintText: 'Insira seu texto',
                        controller: _wordController,
                        prefixIcon: const Icon(Icons.text_fields),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormFieldWidget(
                        labelText: 'Chave',
                        hintText: 'Insira sua chave',
                        controller: _keyController,
                        keyboardtype: TextInputType.text,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            onPressed: () {
                              _process(true);
                            },
                            child: const Text('Encriptar'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.green,
                            ),
                            onPressed: () {
                              _process(false);
                            },
                            child: const Text('Descriptografar'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.red,
                            ),
                            onPressed: _delete,
                            child: const Text('Limpar'),
                          )
                        ],
                      ),
                      const SizedBox(height: 60),
                      Container(
                        color: Colors.white,
                        width: screenWith * .8,
                        height: screenHeight * .1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.grey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                _result,
                                style: const TextStyle(fontSize: 32.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _process(bool isEncrypt) {
    String text = _wordController.text;
    int? key;
    String temp = "";

    try {
      key = int.parse(_keyController.text);
    } catch (e) {
      _showAlert("Chave inválida");
    }

    for (int i = 0; i < text.length; i++) {
      int ch = text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        temp += " ";
        continue;
      } else {
        _showAlert("Texto inválido");
        temp = "";
        break;
      }

      int c;
      if (isEncrypt) {
        c = (ch + key! - offset) % 26;
      } else {
        c = (ch - key! - offset) % 26;
      }
      h = String.fromCharCode(c + offset);
      temp += h;
    }

    setState(() {
      _result = temp;
    });
  }

  void _delete() {
    _wordController.clear();
    _keyController.clear();
    setState(() {
      _result = "";
    });
  }

  Future<void> _showAlert(String alert) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Algo está errado'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(alert),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }
}
