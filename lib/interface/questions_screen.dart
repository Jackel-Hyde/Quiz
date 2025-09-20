import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz/interface/correct_screen.dart';
import 'package:quiz/interface/result_screen.dart';
import '../elements/custom_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedIndex;
  int _correctAnswersCount = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question': "Which element in the periodic table has the symbol Fe?",
      'answers': ['Fluorine', 'Iron', 'Phosphorus', 'Francium'],
      'correct': 1,
    },
    {
      'question': 'Who won the 2022 FIFA World Cup?',
      'answers': ['Germany', 'Argentina', 'France', 'Brazil'],
      'correct': 1,
    },
    {
      'question': 'Which planet in our solar system is the largest in size?',
      'answers': ['Earth', 'Venus', 'Jupiter', 'Mars'],
      'correct': 2,
    },
    {
      'question': 'Which of the following is a programming language?',
      'answers': ['HTML', 'Python', 'CSS', 'SQL'],
      'correct': 1,
    },
    {
      'question': "Which gas is primarily responsible for the greenhouse effect on Earth?",
      'answers': ['Oxygen', 'Nitrogen', 'Carbon dioxide', 'Helium'],
      'correct': 2,
    },
  ];

  void _goToNextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            correctAnswers: _correctAnswersCount,
            totalQuestions: questions.length,
          ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];
    final answers = currentQuestion['answers'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Quiz ${_currentQuestionIndex + 1}',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            for (int i = 0; i < answers.length; i++) ...[
              CustomButton(
                onPressed: () async {
                  final isCorrect = i == currentQuestion['correct'];

                  final result = await Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 600),
                      reverseTransitionDuration: Duration(milliseconds: 400),
                      pageBuilder: (_, __, ___) => CorrectScreen(isCorrect: isCorrect),
                      transitionsBuilder: (_, animation, __, child) {
                        final offsetAnimation = Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ));

                        return Stack(
                          children: [
                            BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 2 * animation.value,
                                sigmaY: 2 * animation.value,
                              ),
                              child: Container(color: Colors.black.withOpacity(0)),
                            ),
                            SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            ),
                          ],
                        );
                      },
                    ),
                  );

                  if (result == true) {
                    if (isCorrect) {
                      _correctAnswersCount++;
                    }
                    _goToNextQuestion();
                  }
                },
                text: answers[i],
                textColor: _selectedIndex == i ? Colors.white : Colors.black,
                color: _selectedIndex == i ? Color(0xFF26A69A) : Colors.white,
              ),
              SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}
