import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  // static final baseUrl = "https://jsonplaceholder.typicode.com/photos";

  // static Future<http.Response> getRequest(endPoint) async {
  //   http.Response response;
  //   try {
  //     response = await http.Client()
  //         .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //   } on Exception catch (e) {
  //     throw e;
  //   }

  //   return response;
  // }

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.Client()
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
