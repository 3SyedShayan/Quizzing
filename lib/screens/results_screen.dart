import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzing/data/questions.dart';
import 'package:quizzing/home.dart';
import 'package:quizzing/question_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key,
      required this.final_answers,
      required this.onRestart,
      required this.onLeaderboard});
  List<String> final_answers = [];
  final VoidCallback onLeaderboard;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < final_answers.length; i++) {
      summary.add({
        'question_num': i,
        'question': questions[i].question,
        'correct_ans': questions[i].answer[0],
        'answer': final_answers[i],
      });
    }

    return summary;
  }

  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['correct_ans'] == data['answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$userName answered $correctAnswers out of $totalQuestions Questions Correctly!",
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 230, 200, 253),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: onRestart,
                  label: const Text('Restart Quiz'),
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
                // Spacer(
                //   flex: 5,
                // ),
                // ElevatedButton.icon(
                //   onPressed: onLeaderboard,
                //   label: const Text('Leaderboard'),
                //   icon: const Icon(Icons.leaderboard),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
