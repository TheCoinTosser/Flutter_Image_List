import 'dart:convert';

import 'package:flutterpresentation/screens/details/ImageDetailsModel.dart';
import 'package:http/http.dart' as http;

class ImageDetailsNetworking {

  static Future<ImageDetailsModel> fetchImageDetails(int imageId) async{
    final response = await http.get("https://picsum.photos/id/$imageId/info");
    if (response.statusCode == 200) {
      return ImageDetailsModel.fromJson(json.decode(response.body));
    }

    throw Exception("Failed to load details");
  }
}