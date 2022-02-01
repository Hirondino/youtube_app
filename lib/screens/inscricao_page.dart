import 'package:flutter/material.dart';

class InscricaoPage extends StatefulWidget {
  InscricaoPage({Key key}) : super(key: key);

  @override
  _InscricaoPageState createState() => _InscricaoPageState();
}

class _InscricaoPageState extends State<InscricaoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Inscrição",
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ),
    );
  }
}