import 'package:flutter/foundation.dart';
import 'package:music_composer/services/llm_service.dart';

class LLMProvider extends ChangeNotifier {
  String _musicResponse = '';
  bool _isLoading = false;

  String get musicResponse => _musicResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchMusic(String prompt) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await LLMService.getMusicFromPrompt(prompt);
      _musicResponse = response;
    } catch (e) {
      _musicResponse = 'Error: Unable to fetch music. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
