import 'package:credits_api/credits_api.dart';
import 'package:credits_api/src/models/credit.dart';

class MovieException implements Exception {}

class SearchException implements Exception {}

class CreditRepository {
  CreditRepository({CreditsApiClient? creditApiClient})
      : _creditApiClient = creditApiClient ?? CreditsApiClient();

  final CreditsApiClient _creditApiClient;

  Future<Credit> getActors(int id) {
    try {
      return _creditApiClient.getActors(id);
    } on Exception {
      throw SearchException();
    }
  }
}
