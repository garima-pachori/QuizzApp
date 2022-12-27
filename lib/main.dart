import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main(){
  runApp(MyApp());
}
  

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions=const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': ['Black','Red','Green','Cyan'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Rabbit','Saarthak','Elephant','Ankush'],
    },
    {
      'questionText': 'What\'s your favourite instructor?',
      'answers': ['Max','Max','Max','Max'],
    }
    ];
  var questionIndex=0;

  void answerQuestion(){
   
    setState(() {
       questionIndex=questionIndex+1;
    });
   print(questionIndex);
    if(questionIndex < questions.length){
      print('We have more question!');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: 
          Text('My first App'),
        ),
        body: questionIndex < questions.length
         ? Column(
            children: [
              Question(
                questions[questionIndex]['questionText'] as String,
              ),
              ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(answerQuestion, answer);
              }).toList()
            ],
          ),
      ),
    );
  }
}