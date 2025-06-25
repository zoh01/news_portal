import 'dart:convert';

import 'package:news_portal/features/domain/models/explore_models.dart';
import 'package:http/http.dart' as http;

class ExploreNews {
  List<ExploreModels> categories = [];

  Future<void> getCategories(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f884d22f286544c6b86bdefd207c5cbc";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ExploreModels exploreModels = ExploreModels(
            newsImage: element["urlToImage"],
            newsTitle: element["description"],
            newsDesc: element["title"],
            newsUrl: element["url"]
          );
          categories.add(exploreModels);
        }
      });
    }
  }
}
