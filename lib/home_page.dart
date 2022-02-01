import 'package:flutter/material.dart';
import 'package:youtube_app/screens/biblioteca_page.dart';
import 'package:youtube_app/screens/emalta_page.dart';
import 'package:youtube_app/screens/inscricao_page.dart';
import 'package:youtube_app/screens/start_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  String _result = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      StartPage(_result),
      EmAltaPage(),
      InscricaoPage(),
      BibliotecaPage()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () async{
              String res = await showSearch(context: context, delegate: null);
              setState(() {
                _result = res;
              });
            }
          ),
          /* IconButton(
            icon: Icon(Icons.videocam), 
            onPressed: () {}
          ),
          IconButton(
            icon: Icon(Icons.account_circle), 
            onPressed: () {}
          ), */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: screens[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "Inicio",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder)
          )
        ]
      ),
    );
  }
}