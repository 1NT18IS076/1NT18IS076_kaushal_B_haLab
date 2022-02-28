import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> questions = [
    Question(questionText: "Question 1", answer: true),
    Question(questionText: "Question 2", answer: false),
    Question(questionText: "Question 3", answer: true),
    Question(questionText: "Question 4", answer: false),
    Question(questionText: "Question 5", answer: true),
    Question(questionText: "Question 6", answer: false),
  ];

  int _score = 0;
  int _questionNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _questionNum < questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    questions[_questionNum].questionText,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                      onPressed: () =>
                          checkAnswer(questions[_questionNum].answer, true),
                      child: const Text('True')),
                  ElevatedButton(
                      onPressed: () =>
                          checkAnswer(questions[_questionNum].answer, false),
                      child: const Text('False')),
                  const SizedBox(height: 50.0),
                  Text('Score: $_score')
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Your score is $_score !'),
                  ElevatedButton(
                      onPressed: reset, child: const Text('Play again'))
                ],
              ),
      ),
    );
  }

  void checkAnswer(bool answer, bool value) {
    if (answer == value) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      _questionNum++;
    });
  }

  void reset() {
    setState(() {
      _score = 0;
      _questionNum = 0;
    });
  }
}
