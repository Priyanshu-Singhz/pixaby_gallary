// image_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class ImageService {
  Future<List<ImageModel>> fetchImages() async {
    final response = await http.get(
      Uri.parse('https://pixabay.com/api/?key=43431517-eb4d67513b39875782756e2c6'), // Include your Pixabay API key in the URL
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> photoList = responseData['hits'];
      return photoList
          .map((photo) => ImageModel(
                imageUrl: photo['largeImageURL'],
                likes: photo['likes'] ?? 0,
                views: photo['views'] ?? 0,
              ))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
