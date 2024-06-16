import 'package:flutter/material.dart';
import 'package:flutter_application_2/model.dart';
import 'package:flutter_application_2/quizrep.dart';
import 'package:shared_preferences/shared_preferences.dart';
class QuizProvider with ChangeNotifier {
  final QuizRepository _quizRepository = QuizRepository();
  List<Quiz> _quizzes = [];
  List<int> _favoriteQuizIds = [];

  List<Quiz> get quizzes => _quizzes;
  List<Quiz> get favoriteQuizzes =>
      _quizzes.where((quiz) => _favoriteQuizIds.contains(quiz.id)).toList();

  QuizProvider() {
    fetchQuizzes();
    loadFavorites();
  }

  Future<void> fetchQuizzes() async {
    _quizzes = await _quizRepository.fetchQuizzes();
    notifyListeners();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteQuizIds = prefs.getStringList('favorites')?.map((id) => int.parse(id)).toList() ?? [];
    notifyListeners();
  }

  Future<void> toggleFavorite(int quizId) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favoriteQuizIds.contains(quizId)) {
      _favoriteQuizIds.remove(quizId);
    } else {
      _favoriteQuizIds.add(quizId);
    }
    prefs.setStringList('favorites', _favoriteQuizIds.map((id) => id.toString()).toList());
    notifyListeners();
  }
}
