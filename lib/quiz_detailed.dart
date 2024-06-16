
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model.dart';


class QuizDetailScreen extends StatelessWidget {
  final Quiz quiz;

  QuizDetailScreen({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(quiz.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: quiz.questions.length,
        itemBuilder: (context, index) {
          final question = quiz.questions[index];

          return Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.questionText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ...question.options.map((option) {
                    return ListTile(
                      title: Text(option.optionText),
                      subtitle: option.shortDescription != null ? Text(option.shortDescription!) : null,
                      leading: CircleAvatar(
                        child: Text(option.id.toString()),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
