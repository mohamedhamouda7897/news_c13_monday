import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c13/models/NewsDataResponse.dart';
import 'package:news_c13/models/source_response.dart';

class ApiManager {
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "dc3d106e730c4256b8c275d9da58d090"});

    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);

    return sourceResponse;
  }

  static Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "dc3d106e730c4256b8c275d9da58d090", "sources": sourceId});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(json);
    return newsDataResponse;
  }
}
