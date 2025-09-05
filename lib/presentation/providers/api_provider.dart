import 'package:flutter/material.dart';
import 'package:meme_app_flutter/data/models/ApiResponse.dart';
import 'package:meme_app_flutter/data/repositories/api_repository.dart';

class ApiProvider extends ChangeNotifier {
  final apiRepository = ApiRepository();
  List<Memes>? _memes = [];
  List<Memes>? get memes => _memes;

  Future<void> fetchMeme() async {
    _memes = await apiRepository.fetchMemes();
    notifyListeners();
  }
}
