import 'package:equatable/equatable.dart';
import 'package:movie_api/src/models/movie_detail.dart';

// ignore: must_be_immutable
class MovieDetailModel extends Equatable {
  MovieDetailModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  int? page;
  List<MovieDetail>? results;
  int? totalPages;
  int? totalResults;

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieDetail>[];
      json['results'].forEach((v) {
        results!.add(MovieDetail.fromJson(v));
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
