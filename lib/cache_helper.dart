import 'package:hive/hive.dart';
import 'package:news_c13/models/news_data_response.dart';
import 'package:news_c13/models/source_response.dart';

class HiveService {
  static const String _boxName = "SourcesBox1";
  static const String _boxNewsName = "NewsBox1";

  static Future<Box<SourceResponse>> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<SourceResponse>(_boxName);
    }

    return Hive.box<SourceResponse>(_boxName);
  }

  static Future<void> saveSourceResponse(SourceResponse sourceResponse) async {
    final box = await _openBox();
    await box.put("sourceResponse", sourceResponse);
  }

  static Future<SourceResponse> getSourceResponse() async {
    final box = await _openBox();

    SourceResponse? sourceResponse = box.get("sourceResponse");

    return sourceResponse ?? SourceResponse();
  }

  static Future<void> deleteSources() async {
    final box = await _openBox();
    await box.delete("sourceResponse");
  }

//////////
  static Future<Box<NewsDataResponse>> _openNewsBox() async {
    if (!Hive.isBoxOpen(_boxNewsName)) {
      return await Hive.openBox<NewsDataResponse>(_boxNewsName);
    }

    return Hive.box<NewsDataResponse>(_boxNewsName);
  }

  static Future<void> saveNewsResponse(NewsDataResponse newsData) async {
    final box = await _openNewsBox();
    await box.put("newsResponse", newsData);
  }

  static Future<NewsDataResponse> getNewsResponse() async {
    final box = await _openNewsBox();

    NewsDataResponse? newsDataResponse = box.get("newsResponse");

    return newsDataResponse ?? NewsDataResponse();
  }

  static Future<void> deleteNews() async {
    final box = await _openNewsBox();
    await box.delete("newsResponse");
  }
}
