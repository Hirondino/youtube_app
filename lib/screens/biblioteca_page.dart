import 'package:flutter/material.dart';

class BibliotecaPage extends StatefulWidget {
  BibliotecaPage({Key key}) : super(key: key);

  @override
  _BibliotecaPageState createState() => _BibliotecaPageState();
}

class _BibliotecaPageState extends State<BibliotecaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Biblioteca",
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ),
    );
  }
}