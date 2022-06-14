import 'package:equatable/equatable.dart';
import 'package:movie_api/src/models/movie.dart';

// ignore: must_be_immutable
class MovieModel extends Equatable {
  MovieModel({this.page, this.results, this.totalPages, this.totalResults});

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
