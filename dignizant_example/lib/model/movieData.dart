class MovieData {
  MovieData({
    required this.movies,
  });
  late final List<Movies> movies;

  MovieData.fromJson(Map<String, dynamic> json){
     if(json['movies'] != null) {
      movies = <Movies>[];
      json['role'].forEach((v) {
        movies.add(new Movies.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['movies'] = movies.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Movies {
  Movies({
    required this.id,
    required this.name,
    required this.year,
    required this.director,
    required this.mainStar,
    required this.description,
    required this.favoritedByUsers,
    required this.genres,
    required this.thumbnail,
  });
  late final int id;
  late final String name;
  late final String year;
  late final String director;
  late final String mainStar;
  late final String description;
  late final int favoritedByUsers;
  late final List<String> genres;
  late final String thumbnail;
  late final String bannerImageURL;


  Movies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    year = json['year'];
    director = json['director'];
    mainStar = json['main_star'];
    description = json['description'];
    favoritedByUsers = json['favorited_by_users'];
    genres = List.castFrom<dynamic, String>(json['genres']);
    thumbnail = json['thumbnail'];
    bannerImageURL = thumbnail.replaceAll("/thumb/","/medium/");
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['year'] = year;
    _data['director'] = director;
    _data['main_star'] = mainStar;
    _data['description'] = description;
    _data['favorited_by_users'] = favoritedByUsers;
    _data['genres'] = genres;
    _data['thumbnail'] = thumbnail;
    return _data;
  }
}