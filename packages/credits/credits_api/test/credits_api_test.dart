import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockingjay/mockingjay.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late Uri movieUri;
  group("MovieApiClient", () {
    late http.Client httpClient;
    // late MovieA movieApiClient;
  });
}
