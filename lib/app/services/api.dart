import 'package:coronavirus_restapi_flutter_app/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  API({@required this.apiKey});
  final String apiKey;

  /// Factory constructor basically for different environments shayad
  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  ///So below what we are doing is to define a resource identifier that
  ///we will use to get the access token&&&&It's a method
  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _paths[endpoint],
      );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}
