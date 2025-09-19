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
      'question': "What gas is the main component of the Earth's atmosphere?",
      'answers': ['Oxygen', 'Nitrogen', 'Carbon dioxide', 'Hydrogen'],
      'correct': 1,
    },
    {
      'question': 'Which planet in the Solar System is known for its rings?',
      'answers': ['Mars', 'Jupiter', 'Saturn', 'Venus'],
      'correct': 2,
    },
    {
      'question': 'Who wrote the novel War and Peace?',
      'answers': ['Fyodor Dostoevsky', 'Leo Tolstoy', 'Alexander Pushkin', 'Anton Chekhov'],
      'correct': 1,
    },
    {
      'question': 'Which element in the periodic table has the symbol "O"?',
      'answers': ['Osmium', 'Tin', 'Oxygen', 'Gold'],
      'correct': 2,
    },
    {
      'question': "Which country is the birthplace of the Olympic Games?",
      'answers': ['Italy', 'Greece', 'France', 'Egypt'],
      'correct': 1,
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
                    MaterialPageRoute(
                      builder: (_) => CorrectScreen(isCorrect: isCorrect),
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
