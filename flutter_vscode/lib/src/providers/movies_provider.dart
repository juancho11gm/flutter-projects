import 'dart:async';

import 'package:flutter_vscode/src/models/actors_model.dart';
import 'package:flutter_vscode/src/models/movie_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apikey = 'c71e55ef64432cf2a8d08621faa4cbc1';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularsPage = 0;
  bool _loading = false;

  List<Movie> _populars = new List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;

  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  void disposeStreams(){
    _popularsStreamController?.close();
  }

  Future<List<Movie>> _handleRequest(Uri url) async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url,'3/movie/now_playing', {
      'api_key' : _apikey,
      'language': _language
    });
    return await _handleRequest(url);
  }

  Future<List<Movie>> getPopularMovies() async {
    if(_loading) return [];

    _loading = true;

    _popularsPage++;
    final url = Uri.https(_url,'3/movie/popular', {
      'api_key' : _apikey,
      'language': _language,
      'page'    : _popularsPage.toString()
    });

    final resp = await _handleRequest(url);
    _populars.addAll(resp);
    popularsSink(_populars);
    _loading = false;
    return resp;

  }

  Future<List<Actor>> getCast(String movieId) async{
    final url = Uri.https(_url,'3/movie/$movieId/credits', {
      'api_key' : _apikey,
      'language': _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);
    return cast.actors;
  }

  Future<List<Movie>> searchMovie (String query) async {
    final url = Uri.https(_url,'3/search/movie', {
      'api_key' : _apikey,
      'language': _language,
      'query'   : query
    });
    return await _handleRequest(url);
  }
}

