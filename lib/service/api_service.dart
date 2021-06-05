import 'dart:async';
import 'dart:convert';
import 'package:news_app/model/articleModel.dart';
import 'package:http/http.dart' as http;

class ApiServiceWSJ {
  var endPointUrl = Uri.parse(
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5f028fdeccdb4064b248f8fdf632e93c");

  Future<List<Article>> getArticle() async {
    var response = await http.get(endPointUrl);
    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> body = json['articles'];

    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;

    // if (response.statusCode == 200) {

    // } else {
    //   throw ("Can't get the article");
    // }
  }
}

class ApiServiceApple {
  String apiKey = "";
  var endPointUrl = Uri.parse(
      "https://newsapi.org/v2/everything?q=apple&from=2021-06-${DateTime.now().subtract(Duration(days: 1))}&to=2021-06-${DateTime.now().subtract(Duration(days: 1))}&sortBy=popularity&apiKey=5f028fdeccdb4064b248f8fdf632e93c");

  Future<List<Article>> getArticle() async {
    var response = await http.get(endPointUrl);
    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> body = json['articles'];

    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;
    // if (response.statusCode == 200) {

    // } else {
    //   throw ("Can't get the article");
    // }
  }
}

class ApiServiceIndonesia {
  var endPointUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=5f028fdeccdb4064b248f8fdf632e93c");

  Future<List<Article>> getArticle() async {
    var response = await http.get(endPointUrl);
    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> body = json['articles'];
    print(response);

    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;

    // if (response.statusCode == 200) {

    // } else {
    //   throw ("Can't get the article");
    // }
  }
}

class ApiServiceTesla {
  var endPointUrl = Uri.parse(
      "https://newsapi.org/v2/everything?q=tesla&from=2021-05-${DateTime.now()}&sortBy=publishedAt&apiKey=5f028fdeccdb4064b248f8fdf632e93c");

  Future<List<Article>> getArticle() async {
    var response = await http.get(endPointUrl);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
    // if (response.statusCode == 200) {

    //
    // } else {
    //   throw ("Can't get the article");
    // }
  }
}
