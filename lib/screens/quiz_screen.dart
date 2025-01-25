import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:quizzing/models/answerbutton.dart';
import 'package:quizzing/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key, required this.getAnswers, required this.onTimeOut});
  final VoidCallback onTimeOut;
  final void Function(String answer) getAnswers;
  @override
  State<QuizScreen> createState() => _QuizState();
}

class _QuizState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  void questionIndex(String answer) {
    if (currentQuestionIndex <= questions.length - 1) {
      setState(() {
        widget.getAnswers(answer);
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questions[currentQuestionIndex].question,
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              ...currentQuestion.shuffledAnswers.map(
                (answer) {
                  return AnswerButton(
                    answer: answer,
                    onPressed: () {
                      questionIndex(answer);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 60,
        right: 35,
        child: CircularCountDownTimer(
          duration: (questions.length * 4),
          width: 90,
          height: 90,
          textStyle: GoogleFonts.roboto(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          fillColor: const Color.fromARGB(255, 255, 7, 218),
          ringColor: Colors.white,
          isReverse: true,
          onStart: () {
            print("Countdown Started");
          },
          onComplete: () {
            widget.onTimeOut();
            print("times Up!");
          },
        ),
      ),
    ]);
  }
}
