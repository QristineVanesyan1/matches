import 'package:matches/data/rest_common.dart';

class API {
  static Uri events(String data) => RestThesportsdb().baseUrl(
      additional: ['eventsday.php'],
      token: '40130162',
      queryParameters: {'d': data});

  static Uri preload() => RestKueski().baseUrl({'key': '9ckcsrbnkseenkjkuh04'});
}
