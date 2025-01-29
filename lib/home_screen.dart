import 'package:flutter/material.dart';
import 'package:news_c13/api_manager.dart';
import 'package:news_c13/models/source_response.dart';
import 'package:news_c13/sources_section.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: SourcesSection());
  }
}
