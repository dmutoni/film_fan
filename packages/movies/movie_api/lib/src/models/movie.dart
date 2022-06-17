import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/src/models/json_map.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Movie extends Equatable {
  const Movie({
    this.id,
    this.title,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.genreIds,
    this.originalLanguage,
    this.popularity,
    this.video,
    this.originalTitle,
  });

  final String? posterPath;
  final bool? adult;
  final String? overview;
  final String? releaseDate;
  final List<int>? genreIds;
  final int? id;
  final String? originalTitle;
  final String? originalLanguage;
  final String? title;
  final String? backdropPath;
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final double? voteAverage;

  /// Deserializes the given [JsonMap] into a [Movie].
  static Movie fromJson(JsonMap json) => _$MovieFromJson(json);

  /// Converts this [Movie] into a [JsonMap].
  JsonMap toJson() => _$MovieToJson(this);

  @override
  List<Object?> get props => [
        posterPath,
        adult,
        overview,
        releaseDate,
        genreIds,
        id,
        originalTitle,
        originalLanguage,
        title,
        backdropPath,
        popularity,
        voteCount,
        video,
        voteAverage,
      ];
}
