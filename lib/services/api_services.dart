import 'dart:convert';
import 'dart:developer';

import 'package:football/models/event_model.dart';
import 'package:http/http.dart';

class ApiServices {
  static const String key =
      "a84b4569b0f17e28ebcb62ca5414e31e9415a9d6d780690025d11f4d715923d8";

  ///https://apiv3.apifootball.com/?action=get_events&from=2023-04-05&to=2023-04-05&league_id=152&APIkey=xxxxxxxxxxxxxx
  static const String base = "apiv3.apifootball.com";

  static Uri resultPath({
    required String from,
    required String to,
    required String league,
  }) {
    final Uri uri = Uri.parse(
      "https://apiv3.apifootball.com/?action=get_events&from=$from&to=$to&league_id=$league&APIkey=$key",
    );
    return uri;
  }

  static Future<List<EventModel>> getEvents({
    required String from,
    required String to,
    required String league,
  }) async {
    List<EventModel> events = [];

    final response = await get(resultPath(from: from, to: to, league: league));

    if (response.statusCode == 200) {
      final dataList = jsonDecode(response.body);
      for (final item in dataList) {
        try {
          events.add(EventModel.fromJson(item));
        } catch (error, st) {
          log("Error parsing EventModel:", error: error, stackTrace: st);
        }
      }
    }

    return events;
  }
}
