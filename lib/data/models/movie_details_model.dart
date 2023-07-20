class MovieDetailsModel {
  bool? adult;
  String? backdroppath;
  BelongsToCollection? belongstocollection;
  int? budget;
  List<Genre?>? genres;
  String? homepage;
  int? id;
  String? imdbid;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  double? popularity;
  String? posterpath;
  List<ProductionCompany?>? productioncompanies;
  List<ProductionCountry?>? productioncountries;
  String? releasedate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage?>? spokenlanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteaverage;
  int? votecount;

  MovieDetailsModel({
    this.adult,
    this.backdroppath,
    this.belongstocollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbid,
    this.originallanguage,
    this.originaltitle,
    this.overview,
    this.popularity,
    this.posterpath,
    this.productioncompanies,
    this.productioncountries,
    this.releasedate,
    this.revenue,
    this.runtime,
    this.spokenlanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteaverage,
    this.votecount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    List<Genre> genres = <Genre>[];
    List<ProductionCompany> productioncompanies = <ProductionCompany>[];
    List<ProductionCountry> productioncountry = <ProductionCountry>[];
    List<SpokenLanguage> spokenlanguages = <SpokenLanguage>[];
    return MovieDetailsModel(
      adult: json['adult'],
      backdroppath: json['backdrop_path'],
      belongstocollection: json['belongs_to_collection'] != null
          ? BelongsToCollection?.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: json['genres'] != null
          ? json['genres'].forEach((v) {
              genres.add(Genre.fromJson(v));
            })
          : [],
      homepage: json['homepage'],
      id: json['id'],
      imdbid: json['imdb_id'],
      originallanguage: json['original_language'],
      originaltitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterpath: json['poster_path'],
      productioncompanies: json['production_companies'] != null
          ? json['production_companies'].forEach((v) {
              productioncompanies.add(ProductionCompany.fromJson(v));
            })
          : [],
      productioncountries: json['production_countries'] != null
          ? json['production_countries'].forEach((v) {
              productioncountry.add(ProductionCountry.fromJson(v));
            })
          : [],
      releasedate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenlanguages: json['spoken_languages'] != null
          ? json['spoken_languages'].forEach((v) {
              spokenlanguages.add(SpokenLanguage.fromJson(v));
            })
          : [],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteaverage: json['vote_average'],
      votecount: json['vote_count'],
    );
  }
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterpath;
  String? backdroppath;

  BelongsToCollection({this.id, this.name, this.posterpath, this.backdroppath});

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterpath = json['poster_path'];
    backdroppath = json['backdrop_path'];
  }
}

class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ProductionCompany {
  int? id;
  String? logopath;
  String? name;
  String? origincountry;

  ProductionCompany({this.id, this.logopath, this.name, this.origincountry});

  ProductionCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logopath = json['logo_path'];
    name = json['name'];
    origincountry = json['origin_country'];
  }
}

class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({this.iso31661, this.name});

  ProductionCountry.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
}

class SpokenLanguage {
  String? englishname;
  String? iso6391;
  String? name;

  SpokenLanguage({this.englishname, this.iso6391, this.name});

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    englishname = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
}
