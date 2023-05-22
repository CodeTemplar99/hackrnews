import 'package:flutter/material.dart';
import 'package:hackrnews/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService with ChangeNotifier {
  List<int> topNewsdataList = [];
  List<int> recommendedNewsdataList = [];
  List<dynamic> topNewsList = [];
  List<dynamic> recommendedNewsList = [];

  Map<String, dynamic> viewPost = {};

  Future<List> fetchTopNews() async {
    final response = await http.get(
      Uri.parse('$baseurl/topstories.json$prettyFormat'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      topNewsdataList = List<int>.from(jsonData).take(5).toList();

      topNewsList.clear();
      for (var item in topNewsdataList) {
        final postResponse = await http.get(
          Uri.parse(
              'https://hacker-news.firebaseio.com/v0/item/$item.json$prettyFormat'),
        );
        if (postResponse.statusCode == 200) {
          final topNewsData = json.decode(postResponse.body);
          topNewsList.add(topNewsData);
        }
      }

      return topNewsList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List> fetchForYouNews() async {
    final response =
        await http.get(Uri.parse('$baseurl/topstories.json$prettyFormat'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      recommendedNewsdataList = List<int>.from(jsonData).take(20).toList();

      for (var itemId in recommendedNewsdataList) {
        final postResponse = await http.get(
          Uri.parse(
            '$baseurl/item/$itemId.json?print=pretty',
          ),
        );
        if (postResponse.statusCode == 200) {
          final recommendedNewsData = json.decode(postResponse.body);
          recommendedNewsList.add(recommendedNewsData);
        }
      }

      // notifyListeners();
      return recommendedNewsList.sublist(5);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Map<String, dynamic>> viewNews(String itemID) async {
    final response = await http.get(Uri.parse(
        'https://hacker-news.firebaseio.com/v0/item/$itemID.json?print=pretty'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List comments = [];
      for (var id in jsonData['kids']) {
        final response = await http.get(
          Uri.parse(
              'https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty'),
        );
        if (response.statusCode == 200) {
          final commentData = json.decode(response.body);
          comments.add(commentData);
        }
      }
      jsonData['kids'] = comments;
      viewPost = jsonData;
      return viewPost;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
