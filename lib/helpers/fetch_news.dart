import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newsbook_app/models/news_class.dart';

// Get Your API KEY from "https://newsapi.org/account"
final String key = "API Key";

class FetchNews {
  List<NewsModel> news = [];
  getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=" + key;
    var response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(
      response.body,
    );
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['description'] != null) {
          NewsModel article = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'] == null
                ? "https://cdn.mos.cms.futurecdn.net/PuXipAW3AXUzUJ4uYyxPKC-1200-80.jpg"
                : element['urlToImage'],
            articleURL: element["url"],
          );
          news.add(
            article,
          );
        }
      });
    }
  }
}

class FetchNewsCategory {
  List<NewsModel> news = [];
  getNewsCategory(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=" + category;
    url = url + "&apiKey=" + key;
    var response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(
      response.body,
    );
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['description'] != null) {
          NewsModel article = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'] == null
                ? "https://cdn.mos.cms.futurecdn.net/PuXipAW3AXUzUJ4uYyxPKC-1200-80.jpg"
                : element['urlToImage'],
            articleURL: element["url"],
          );
          news.add(
            article,
          );
        }
      });
    }
  }
}
