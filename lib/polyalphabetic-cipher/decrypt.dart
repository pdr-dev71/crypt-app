import 'package:cryptographic_algorithms_app/widgets/custom_buttom_widget.dart';
import 'package:cryptographic_algorithms_app/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

import 'code.dart';

class Decrypt extends StatefulWidget {
  const Decrypt({Key? key}) : super(key: key);

  @override
  DecryptState createState() => DecryptState();
}

class DecryptState extends State<Decrypt> {
  String _result = "";
  final TextEditingController _plainText = TextEditingController();
  final TextEditingController _keyValue = TextEditingController();

  @override
  void dispose() {
    _plainText.dispose();
    _keyValue.dispose();
    super.dispose();
  }

  void _delete() {
    _plainText.clear();
    _keyValue.clear();
    setState(() {
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Decryption"),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
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
                    child: Image.asset(
                      "assets/images/vigenere2.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
                    child: CustomTextFormFieldWidget(
                      labelText: 'Texto',
                      hintText: 'Seu texto aqui',
                      controller: _plainText,
                      prefixIcon: const Icon(
                        Icons.text_fields,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    child: CustomTextFormFieldWidget(
                      labelText: 'Chave',
                      hintText: 'Sua chave aqui',
                      controller: _keyValue,
                      prefixIcon: const Icon(
                        Icons.key,
                      ),
                    ),
                  ),
                  CustomButtom(
                    onPressed: _Cipher,
                    child: const Text(
                      'Desencriptar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButtom(
                    onPressed: _delete,
                    primary: Colors.red,
                    child: const Text(
                      'Limpar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    color: Colors.white,
                    width: screenWith * .9,
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
        ));
  }

  void _Cipher() {
    //_result = _keyValue.text;
    var shift = _keyValue.text;
    // print(shift);
    var text = _plainText.text;
    //  print(text);
    VigenereCipher enc = VigenereCipher(shift);
    _result = enc.decrypt(text);
    setState(() {});
  }
}
