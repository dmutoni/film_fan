import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockingjay/mockingjay.dart';
import 'package:movie_api/movie_api.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late Uri movieUri;
  group("MovieApiClient", () {
    late http.Client httpClient;
    late MovieApiClient subject;
    final moviesModel = List.generate(
        3,
        (index) => MovieModel(
            page: 1,
            results: List.generate(
                1,
                (index) => const Movie(
                      id: 338953,
                      title: "Batman v Superman: Dawn of Justice",
                      posterPath: "/cGOPbv9wA5gEejkL9MBhT2jvN9X.jpg",
                      overview:
                          "Fearing the actions of a god-like Super Hero left unchecked, Gotham City’s own formidable, forceful vigilante takes on Metropolis’s most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it’s ever known before.",
                      releaseDate: "2016-03-23",
                      backdropPath: "/zGLHX92Gk96O1DJvLil7ObJTbaL.jpg",
                      voteAverage: 5.9,
                      voteCount: 589,
                      adult: false,
                      genreIds: [28, 12, 14, 35, 878],
                      originalLanguage: "en",
                      popularity: 5.8,
                      video: false,
                      originalTitle: "Batman v Superman: Dawn of Justice",
                    ))));
    setUp(() {
      final Map<String, String> queryParameters = {
        'api_key': 'f0760d61c4bc8ae2e06246d60622ae47',
        'language': 'en-US',
        'page': '1',
      };
      httpClient = MockHttpClient();
      subject = MovieApiClient(client: httpClient);
      movieUri = Uri.https(
          MovieApiClient.authority, '/3/movie/now_playing', queryParameters);
    });
    setUp(() {
      registerFallbackValue(Uri());
    });
    test("constructor returns normally", () {
      expect(MovieApiClient.new, returnsNormally);
    });
    test(".fetchAllMovies", () {
      setUp(() {
        when(() => httpClient.get(movieUri)).thenAnswer(
            (_) async => http.Response(json.encode(moviesModel), 200));
      });
    });
    test('throws HttpException when http client throws exception', () {
      when(() => httpClient.get(movieUri)).thenThrow(Exception());

      expect(
        () => subject.fetchAllMovies(),
        throwsA(isA<HttpException>()),
      );
    });
    test(
      'throws HttpRequestFailure when response status code is not 200',
      () {
        when(() => httpClient.get(movieUri)).thenAnswer(
          (_) async => http.Response('', 400),
        );

        expect(
          () => subject.fetchAllMovies(),
          throwsA(
            isA<HttpRequestFailure>()
                .having((error) => error.statusCode, 'statusCode', 400),
          ),
        );
      },
    );
    test(
      'throws JsonDecodeException when decoding response fails',
      () {
        when(() => httpClient.get(movieUri)).thenAnswer(
          (_) async => http.Response('definitely not json!', 200),
        );

        expect(
          () => subject.fetchAllMovies(),
          throwsA(isA<JsonDecodeException>()),
        );
      },
    );
    test('makes correct request', () async {
      await subject.fetchAllMovies();

      verify(
        () => httpClient.get(movieUri),
      ).called(1);
    });

    test('returns correct list of movies', () {
      expect(
        subject.fetchAllMovies(),
        completion(equals(moviesModel)),
      );
    });
  });
}
