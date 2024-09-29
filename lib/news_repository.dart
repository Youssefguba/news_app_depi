import 'package:dio/dio.dart';

class NewsRepository {
  // api calling

  Future<List<dynamic>> getNews() async {
    // endpoint
    // API
    // TODO (1) Convert from Json to NewsModel
    final response = await Dio().get('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4a276487e4824f50942442a71a28b3c8');

    return response.data['articles'];
  }
}
// Socket Exception