import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/providers/movies_provider.dart';
import 'package:flutter_vscode/src/search/search_delegate.dart';
import 'package:flutter_vscode/src/widgets/card_swiper_widget.dart';
import 'package:flutter_vscode/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopularMovies();
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: Text('MOVIES APP'),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context:context, 
                delegate:DataSearch(),
                //query: ''
                );
            },
          )
        ],
      ),
      body: 
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
        )
      )
    );
  }


  Widget _swiperTarjetas(){
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData){
          return CardSwiper(
            movies: snapshot.data
          );
        }else{
          return Container(
            height: 400.0,
            child: Center
                  (child: CircularProgressIndicator()
          )
          );
        }
      },
    );
  }
  
  Widget _footer(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Container(
              padding: EdgeInsets.only(left:20.0),
              child: Text('Populars', style: Theme.of(context).textTheme.subhead),
            ),
            SizedBox(height: 5.0,),
            StreamBuilder(
              stream: moviesProvider.popularsStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  return MovieHorizontal(movies:snapshot.data, nextPage: moviesProvider.getPopularMovies,);
                }else{
                  return  Center(child:CircularProgressIndicator());
                }
              },
            ), 
        ],
      ),
    );
  }

}



