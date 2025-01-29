import 'package:flutter/material.dart';
import 'package:news_c13/api_manager.dart';
import 'package:news_c13/models/NewsDataResponse.dart';
import 'package:news_c13/models/source_response.dart';
import 'package:news_c13/news_item.dart';

class SourcesSection extends StatefulWidget {
  SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error : ${snapshot.error}"));
        } else {
          List<Sources> data = snapshot.data?.sources ?? [];
          return Column(
            children: [
              DefaultTabController(
                  length: data.length,
                  initialIndex: selectedIndex,
                  child: TabBar(
                      onTap: (value) {
                        selectedIndex = value;
                        setState(() {});
                      },
                      dividerColor: Colors.transparent,
                      indicatorColor: Color(0xFF171717),
                      labelColor: Color(0xFF171717),
                      isScrollable: true,
                      tabs: data
                          .map((element) => Tab(
                                text: element.name,
                              ))
                          .toList())),
              Expanded(
                  child: FutureBuilder<NewsDataResponse>(
                future: ApiManager.getNewsData(data[selectedIndex].id ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error : ${snapshot.error}"));
                  } else {
                    var data = snapshot.data?.articles ?? [];

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsItem(
                          article: data[index],
                        );
                      },
                      itemCount: data.length,
                    );
                  }
                },
              ))
            ],
          );
        }
      },
    );
  }
}
