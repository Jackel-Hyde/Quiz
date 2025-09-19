import 'package:flutter/foundation.dart';

class QuizAttempt {
  final int correctAnswers;
  final int totalQuestions;

  QuizAttempt({required this.correctAnswers, required this.totalQuestions});
}

class ResultProvider extends ChangeNotifier {
  final List<QuizAttempt> _history = [];

  List<QuizAttempt> get history => List.unmodifiable(_history);

  void addAttempt({required int correct, required int total}) {
    _history.add(QuizAttempt(correctAnswers: correct, totalQuestions: total));
    notifyListeners();
  }

  void resetHistory() {
    _history.clear();
    notifyListeners();
  }
}
