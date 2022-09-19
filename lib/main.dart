import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
                    'You have pushed the button this many times:',
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
                          scoreKeeper.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
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
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      })
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
