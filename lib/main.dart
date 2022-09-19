import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userPickedAns) {
    bool correctAns = quizBrain.getQuestionAns();
    setState(() {
      if (quizBrain.isFinished() == true) {
        alertbox();
        quizBrain.reset();
        scoreKeeper = [];
        // correntQues = 0;
      } else {
        if (userPickedAns == correctAns) {
          setState(
            () {
              correntQues++;
              scoreKeeper.add(
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              );
            },
          );
        } else {
          setState(
            () {
              scoreKeeper.add(
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              );
            },
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  int correntQues = 0;
  Future<void> alertbox() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Quiz Finished'),
        content: Text('Correct Questions Total ' + '$correntQues'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () => {
                      setState(
                        () => {
                          checkAnswer(true),
                        },
                      ),
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.green,
                        child: Text(
                          "True",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () => {
                      checkAnswer(false),
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.red,
                      child: Text(
                        "False",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(children: scoreKeeper)
            ],
          ),
        ),
      ),
    );
  }
}
