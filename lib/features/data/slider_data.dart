import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_portal/features/domain/models/slider_model.dart';

class SliderData {
  List<SliderModel> sliders = [];

  Future<void> getSliders() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2025-06-11&sortBy=publishedAt&apiKey=f884d22f286544c6b86bdefd207c5cbc";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          SliderModel sliderModel = SliderModel(
            newsImage: element["urlToImage"],
            newsTitle: element["title"],
            newsUrl: element["url"],
            newsDesc: element["description"],
          );
          sliders.add(sliderModel);
        }
      });
    }
  }
}
