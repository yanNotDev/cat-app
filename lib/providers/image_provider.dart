import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cat {
  final String link;

  const Cat({
    required this.link,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      link: json['link'],
    );
  }
}

class CatImage with ChangeNotifier {
  String _url = 'https://cdn2.thecatapi.com/images/gY_iUgK2A.jpg';

  String get url => _url;

  Future<void> getURL() async {
    final response =
        await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = jsonDecode(response.body) as List;
      _url = jsonData[0]['url'];
      notifyListeners();
    } 
  }
}
