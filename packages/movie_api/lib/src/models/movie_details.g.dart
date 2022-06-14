// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      json['id'] as int?,
      json['title'] as String?,
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
      json['overview'] as String?,
      json['release_date'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
      json['adult'] as bool?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['original_language'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['video'] as bool?,
      json['original_title'] as String?,
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIds,
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
