import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/models/movie_model.dart';
import 'package:flutter_vscode/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate{

  String selected = '';
  final moviesProvider = new MoviesProvider();
  final movies = [
    'Spiderman',
    'Captain America',
    'Parasite'
  ];

  final recentMovies = [
    'Spiderman',
    'Captain America'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        }
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 100.0,
        width:100.0,
        color: Colors.blueAccent,
        child: Text(selected)
      ),
    );
  }

   @override
  Widget buildSuggestions(BuildContext context) {
    if( query.isEmpty) return Container();

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if(snapshot.hasData){
          final movies = snapshot.data;

          return ListView(
            children: movies.map((movie){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(movie.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.png'),
                  width: 50.0,
                  fit: BoxFit.contain
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: (){
                  close(context,null);
                  movie.uniqueId = '';
                  Navigator.pushNamed(context,'details',arguments: movie);
                },
              );
            }).toList()
          );
        }else {
          return Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );
  }

 /*  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = (query.isEmpty)
                       ? recentMovies
                       : movies.where ((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(suggestions[i]),
          onTap: (){
            selected = suggestions[i];
            showResults(context);
          },
        );
      }
    );
  } */

}