import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider.dart';
import 'package:flutter_application_2/quiz_detailed.dart';
import 'package:provider/provider.dart';
class QuizListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Quiz',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite,color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteQuizzesScreen()),
              );
            },
          )
        ],
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          if (quizProvider.quizzes.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: quizProvider.quizzes.length,
            itemBuilder: (context, index) {
              final quiz = quizProvider.quizzes[index];
              final isFavorite = quizProvider.favoriteQuizzes.contains(quiz);

              return ListTile(
                title: Text(quiz.title,style: TextStyle(color: Colors.white),),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.white : null,
                  ),
                  onPressed: () {
                    quizProvider.toggleFavorite(quiz.id);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizDetailScreen(quiz: quiz)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class FavoriteQuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Favorite Quiz',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          if (quizProvider.favoriteQuizzes.isEmpty) {
            return Center(child: Text('No any favorite quiz',style: TextStyle(color: Colors.white,fontSize: 30),));
          }
          return ListView.builder(
            itemCount: quizProvider.favoriteQuizzes.length,
            itemBuilder: (context, index) {
              final quiz = quizProvider.favoriteQuizzes[index];

              return ListTile(
                title: Text(quiz.title,style: TextStyle(color: Colors.white),),
                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    quizProvider.toggleFavorite(quiz.id);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizDetailScreen(quiz: quiz)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
