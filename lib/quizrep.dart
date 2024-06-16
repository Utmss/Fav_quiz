import 'dart:convert';
import 'package:flutter_application_2/model.dart';
import 'package:http/http.dart' as http;


class QuizRepository {
  final String baseUrl = 'https://core.id8devhub.com/api/v1/quizzes/';

  Future<List<Quiz>> fetchQuizzes() async {
    final response = await http.get(Uri.parse(baseUrl));
    
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((quiz) => Quiz.fromJson(quiz)).toList();
    } else {
      throw Exception('Failed to load quizzes');
    }
  }
}
