class Option {
  final int id;
  final String optionText;
  final String? shortDescription;
  final String? media;
  final int votes;

  Option({
    required this.id,
    required this.optionText,
    this.shortDescription,
    this.media,
    required this.votes,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      optionText: json['option_text'],
      shortDescription: json['short_description'],
      media: json['media'],
      votes: json['votes'],
    );
  }
}

class Question {
  final int id;
  final String questionText;
  final List<Option> options;
  final int views;
  final int votes;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.views,
    required this.votes,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsList = json['options'] as List;
    List<Option> options = optionsList.map((i) => Option.fromJson(i)).toList();

    return Question(
      id: json['id'],
      questionText: json['question_text'],
      options: options,
      views: json['views'],
      votes: json['votes'],
    );
  }
}

class Quiz {
  final int id;
  final String title;
  final List<Question> questions;
  final int numberOfQuestions;
  final bool wasPublishedRecently;
  final int views;

  Quiz({
    required this.id,
    required this.title,
    required this.questions,
    required this.numberOfQuestions,
    required this.wasPublishedRecently,
    required this.views,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var questionsList = json['questions'] as List;
    List<Question> questions = questionsList.map((i) => Question.fromJson(i)).toList();

    return Quiz(
      id: json['id'],
      title: json['title'],
      questions: questions,
      numberOfQuestions: json['number_of_questions'],
      wasPublishedRecently: json['was_published_recently'],
      views: json['views'],
    );
  }
}
