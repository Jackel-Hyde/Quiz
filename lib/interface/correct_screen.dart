import 'package:flutter/material.dart';
import '../elements/custom_button.dart';

class CorrectScreen extends StatelessWidget {
  final bool isCorrect;

  const CorrectScreen({
    super.key,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isCorrect ? Color(0xFF26A69A) : Colors.red,
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Icon(
                  isCorrect ? Icons.check : Icons.close,
                  color: Colors.white,
                  size: 200,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  text: 'Next Question',
                  color: isCorrect ? Color(0xFF26A69A) : Colors.red,
                  textColor: Colors.white,
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
