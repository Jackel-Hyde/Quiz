import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../result_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<ResultProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              Text(
                'History',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: quizProvider.history.isEmpty
                    ? Center(
                  child: Text('No attempts yet', style: TextStyle(fontSize: 18, color: Colors.grey)),
                )
                    : ListView.builder(
                  itemCount: quizProvider.history.length,
                  itemBuilder: (context, index) {
                    final attempt = quizProvider.history[index];
                    return Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text('Attempt №${index + 1}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            Spacer(),
                            Text('${attempt.correctAnswers}/${attempt.totalQuestions}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
