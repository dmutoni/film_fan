import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_api/src/models/models.dart';

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

class MovieApiClient {
  MovieApiClient({http.Client? client}) : _client = client ?? http.Client();

  @visibleForTesting
  static const authority = 'api.themoviedb.org';

  final http.Client _client;

  Future<MovieModel> fetchAllMovies() async {
    final Map<String, String> queryParameters = {
      'api_key': 'f0760d61c4bc8ae2e06246d60622ae47',
      'language': 'en-US',
      'page': '1',
    };
    final uri = Uri.https(authority, '/3/movie/now_playing', queryParameters);
    final responseBody = await _get(uri);

    try {
      return MovieModel.fromJson(responseBody);
    } catch (e) {
      throw JsonDeserializationException();
    }
  }

  Future<Map<String, dynamic>> _get(Uri uri) async {
    http.Response response;

    try {
      response = await _client.get(uri);
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }
    try {
      return json.decode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw JsonDecodeException();
    }
  }
}
