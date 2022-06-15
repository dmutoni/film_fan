// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      json['poster_path'] as String?,
      json['adult'] as bool?,
      json['overview'] as String?,
      json['release_date'] as String?,
      (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int?,
      json['original_title'] as String?,
      json['original_language'] as String?,
      json['title'] as String?,
      json['backdrop_path'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['vote_count'] as int?,
      json['video'] as bool?,
      (json['vote_average'] as num?)?.toDouble(),
      json['backdrop_auth'] as String?,
      json['budget'] as int?,
      json['homepage'] as String?,
      json['imdb_id'] as String?,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'backdrop_auth': instance.backdropAuth,
      'budget': instance.budget,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIds?.map((e) => e.toJson()).toList(),
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
