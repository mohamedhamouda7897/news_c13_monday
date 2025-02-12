import 'dart:convert';

import 'package:news_c13/cache_helper.dart';
import 'package:news_c13/models/news_data_response.dart';
import 'package:news_c13/models/source_response.dart';
import 'package:news_c13/repository/home_repo.dart';

class HomeRepoLocalImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    NewsDataResponse newsDataResponse = await HiveService.getNewsResponse();
    return newsDataResponse;
  }

  @override
  Future<SourceResponse> getSources(String catId) async {
    SourceResponse sourceResponse = await HiveService.getSourceResponse();
    return sourceResponse;
  }
}
