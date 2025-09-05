import 'package:meme_app_flutter/data/datasources/api_datasource.dart';
import 'package:meme_app_flutter/data/models/ApiResponse.dart';

class ApiRepository {
  final apiSource = ApiDataSource();

  Future<List<Memes>?> fetchMemes() async {
    final data = await apiSource.getMemes();

    var memes = data.memesList;

    return memes;
  }
}
