import 'package:flutter/material.dart';
import 'package:quiz_app_test/screen/screen_quiz.dart';

import '../model/model_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'What is the capital of Korea?',
      'candidates': ['Seoul', 'Busan', 'Incheon', 'Jeju'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'What is the capital of USA?',
      'candidates': ['New York', 'Washington', 'Los Angeles', 'Chicago'],
      'answer': 1
    }),
    Quiz.fromMap({
      'title': 'What is the capital of Mexico?',
      'candidates': ['Mexico City', 'Guadalajara', 'Monterrey', 'Cancun'],
      'answer': 0
    }),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('My Quiz App'),
        backgroundColor: Colors.deepPurple,
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Image.asset(
            'images/quiz.jpg',
            width: width * 0.8,
          )),
          Padding(padding: EdgeInsets.all(width * 0.024)),
          Text(
            'Welcome to My Quiz App',
            style: TextStyle(fontSize: width * 0.065, fontWeight: FontWeight.bold),
          ),
          const Text(
            '퀴즈를 풀기 전 안내사항입니다. \n 꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
            textAlign: TextAlign.center,),
          Padding(padding: EdgeInsets.all(width * 0.048)),
          _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
          _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤 \n 다음 문제 버튼을 눌러주세요. '),
          _buildStep(width, '3. 만점을 향해 도전해보세요!'),
          Padding(padding: EdgeInsets.all(width * 0.048)),
          Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(quizs: quizs),),);
                    },
                    child: const Text(
                      '지금 퀴즈 풀기',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(padding: EdgeInsets.only(right: width * 0.024)),
          Text(title),
        ],
      ),

    );
  }
}
