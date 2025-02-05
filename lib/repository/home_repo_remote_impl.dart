import 'dart:convert';

import 'package:news_c13/models/NewsDataResponse.dart';
import 'package:news_c13/models/source_response.dart';
import 'package:news_c13/repository/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRepoRemoteImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "dc3d106e730c4256b8c275d9da58d090",
      "sources": sourceId,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(json);
    return newsDataResponse;
  }

  @override
  Future<SourceResponse> getSources(String catId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "dc3d106e730c4256b8c275d9da58d090",
      "category": catId,
    });

    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }
}
