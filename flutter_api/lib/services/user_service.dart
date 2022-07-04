import 'dart:convert';

import 'package:flutter_api/model/usermodel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<List<Articles>?> getData() async {
    var res = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=168026e3b94b4835afb674c78a37e580"),
    );
    if (res.body.isNotEmpty) {
      final resJson = jsonDecode(res.body);
      News news = News.fromJson(resJson);
      return news.articles;
    } else {
      print("İstek Başarısız... => ${res.statusCode}");
    }
    return null;
  }
}
