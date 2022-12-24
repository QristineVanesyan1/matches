class RestThesportsdb {
  final String _http = 'https';
  final String _host = 'www.thesportsdb.com';
  final String _env = 'api';
  final String _version = 'v1';
  final String _type = 'json';

  Uri baseUrl(
          {Map<String, dynamic>? queryParameters,
          String token = '2',
          List<String> additional = const []}) =>
      Uri(
          scheme: _http,
          host: _host,
          pathSegments: [_env, _version, _type, token, ...additional],
          queryParameters: queryParameters);
}

class RestKueski {
  final String _http = 'https';
  final String _host = 'kueski.shop';
  final String _filename = 'cq1al3k.php';

  Uri baseUrl(Map<String, dynamic>? queryParameters) => Uri(
      scheme: _http,
      host: _host,
      pathSegments: [
        _filename,
      ],
      queryParameters: queryParameters);
}
