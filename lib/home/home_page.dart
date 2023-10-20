import 'dart:math';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

// ignore: camel_case_types3
class _Home_PageState extends State<Home_Page> {
  List<Question> questions = [
    Question('Flutter мобильдик тиркеме жасай алабы?', 'true'),
    Question('Кыргызсьанда 7 область барбы?', 'true'),
    Question('Эң кичине материк бул - Түндүк Америкабы?', 'false'),
    Question('Ошко 3000 жыл болгонбу?', 'true'),
    Question('Крокадил бакка чыга алабы?', 'false'),
    Question('Жер планетасы эң чоңбу?', 'false'),
  ];
  int correctQuestionIndex = Random().nextInt(6);
  int baal = 0;

  void chakAnswer(String answer) {
    if (questions[correctQuestionIndex].IsCorrect(answer)) {
      setState(() {
        baal++;
      });
    }
    setState(() {
      correctQuestionIndex = Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'суроо: ${correctQuestionIndex + 1}',
              style: const TextStyle(fontSize: 35),
            ),
            Text(
              'Baal: $baal',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  questions[correctQuestionIndex].questionText,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => chakAnswer('true'),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () => chakAnswer('false'),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Flase',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  String questionText;
  String correctAnswer;
  Question(this.questionText, this.correctAnswer);

  bool IsCorrect(String answer) {
    return answer.toLowerCase() == correctAnswer.toLowerCase();
  }
}
