import 'package:flutter/material.dart';
import 'package:quiz/elements/custom_button.dart';
import 'package:quiz/interface/history_screen.dart';
import 'package:quiz/interface/questions_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Quiz',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionsScreen()),
                );
              },
              text: 'Start',
              color: Color(0xFF26A69A),
              textColor: Colors.white,
              width: 250,
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              },
              text: 'History',
              color: Color(0xFF26A69A),
              textColor: Colors.white,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
