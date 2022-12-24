import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:matches/data/api.dart';
import 'package:matches/models/event.dart';
import 'package:http/http.dart' as http;

enum Redirect {
  google('https://www.google.com'),
  thesportsdb('https://www.thesportsdb.com');

  const Redirect(this.url);
  final String url;

  @override
  String toString() => url;
}

abstract class MatchesRepo {
  Future<List<Event>> fetchEvents(String date);
  Future<Uri> fetchRedirect();
}

class MatchesRepoImpl implements MatchesRepo {
  @override
  Future<Uri> fetchRedirect() async {
    final client = HttpClient();
    Uri uri = API.preload();
    var request = await client.getUrl(uri);
    request.followRedirects = false;
    var response = await request.close();
    while (response.isRedirect) {
      response.drain();
      final location = response.headers.value(HttpHeaders.locationHeader);
      if (location != null) {
        uri = uri.resolve(location);
        request = await client.getUrl(uri);
        request.followRedirects = false;
        response = await request.close();
      }
    }
    return uri;
  }

  @override
  Future<List<Event>> fetchEvents(String date) async {
    final response = await http.get(API.events(date));

    if (response.statusCode == 200) {
      final responseBody = response.body;

      if (responseBody == '') {
        return [];
      }

      final parsed = jsonDecode(responseBody);
      final events = parsed["events"];
      final result = <Event>[];

      events.forEach((event) async {
        result.add(Event.fromJson(event));
      });

      log(responseBody);
      return result;
    } else {
      throw Exception();
    }
  }
}
