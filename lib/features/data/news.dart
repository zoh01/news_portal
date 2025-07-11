import 'dart:convert';

import '../domain/models/article_models.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModels> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/everything?q=apple&from=2025-07-10&to=2025-07-10&sortBy=popularity&apiKey=f884d22f286544c6b86bdefd207c5cbc";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModels articleModels = ArticleModels(
            newsImage: element["urlToImage"],
            newsTitle: element["description"],
            newsDesc: element["title"],
            newsUrl: element["url"]
          );
          news.add(articleModels);
        }
      });
    }
  }
}
