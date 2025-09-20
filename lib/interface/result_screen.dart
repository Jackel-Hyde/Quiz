import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/elements/custom_button.dart';
import '../result_provider.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ResultProvider>(
        context,
        listen: false,
      ).addAttempt(correct: correctAnswers, total: totalQuestions);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Results',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: correctAnswers.toString(),
                    style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '/',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: totalQuestions.toString(),
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Home Page',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
                );
              },
              width: 300,
              textColor: Colors.white,
              color: Color(0xFF26A69A),
            ),
          ],
        ),
      ),
    );
  }
}
