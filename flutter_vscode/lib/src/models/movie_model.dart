class Movies {
    List<Movie> items = new List();
    Movies();
    Movies.fromJsonList(List<dynamic> jsonList){
      if(jsonList == null) return;
      for(var item in jsonList){
        final movie = new Movie.fromJsonMap(item);
        items.add(movie);
      }
    }
}

class Movie {
  String uniqueId; //invented

  String posterPath;
  bool adult;
  String overview;
  String releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;

  Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.voteAverage,
    this.video,
  });

  Movie.fromJsonMap(Map<String,dynamic> json){
    posterPath    = json['poster_path'];
    adult         = json['adult'];
    overview      = json['overview'];
    releaseDate   = json['release_date'];
    genreIds      = json['genre_ids'].cast<int>();
    id            = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'] / 1;
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'] / 1;
    video = json['video'];
  }

  getPosterImg(){
    if(posterPath == null){
      return 'https://image.shutterstock.com/image-vector/no-image-available-sign-internet-260nw-261719003.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

   getBackgroundImg(){
    if(posterPath == null){
      return 'https://image.shutterstock.com/image-vector/no-image-available-sign-internet-260nw-261719003.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}

