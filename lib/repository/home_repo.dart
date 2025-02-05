import 'package:news_c13/models/NewsDataResponse.dart';
import 'package:news_c13/models/source_response.dart';

abstract class HomeRepo {
  Future<SourceResponse> getSources(String catId);

  Future<NewsDataResponse> getNewsData(String sourceId);
}
