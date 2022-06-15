import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/src/models/json_map.dart';

part 'movie_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetail extends Equatable {
  final String? posterPath;
  final bool? adult;
  final String? backdropAuth;
  final int? budget;
  final String? homepage;
  final String? imdbId;
  final String? overview;
  final String? releaseDate;
  final List<Genre>? genres;
  final int? id;
  final String? originalTitle;
  final String? originalLanguage;
  final String? title;
  final String? backdropPath;
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final double? voteAverage;

  const MovieDetail(
      this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genres,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage,
      this.backdropAuth,
      this.budget,
      this.homepage,
      this.imdbId);

  /// Deserializes the given [JsonMap] into a [Movie].
  static MovieDetail fromJson(JsonMap json) => _$MovieDetailFromJson(json);

  /// Converts this [Movie] into a [JsonMap].
  JsonMap toJson() => _$MovieDetailToJson(this);

  @override
  List<Object?> get props => [
        posterPath,
        adult,
        overview,
        releaseDate,
        genres,
        id,
        originalTitle,
        originalLanguage,
        title,
        backdropPath,
        popularity,
        voteCount,
        video,
        voteAverage,
        backdropAuth,
        budget,
        homepage,
        imdbId
      ];
}

// ignore: must_be_immutable
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Genre extends Equatable {
  int? id;
  String? name;

  Genre({this.id, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [id, name];
}
