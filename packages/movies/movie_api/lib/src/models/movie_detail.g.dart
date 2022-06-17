// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      originalLanguage: json['original_language'] as String?,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      budget: json['budget'] as int?,
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'budget': instance.budget,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
