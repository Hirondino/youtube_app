import 'package:flutter/material.dart';
import 'package:youtube_app/api.dart';
import 'package:youtube_app/model/video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class StartPage extends StatefulWidget {
  
  String search;
  StartPage(this.search);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  _listVideos(String search){
    
    Api api = Api();

    return api.pesquisar(search);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listVideos(widget.search),
      builder: (contex, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                itemBuilder: (context, index){

                  List<Video> videos = snapshot.data;
                  Video video = videos[index];

                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API, 
                        videoId: video.id,
                        autoPlay: true
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.image)
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.title),
                          subtitle: Text(video.channel),
                        )
                      ],
                    ),
                  );
                }, 
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ), 
                itemCount: snapshot.data.length
              );
            }else{
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
          default:
        }
      },
    );
  }
}