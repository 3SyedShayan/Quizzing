import 'package:flutter/material.dart';
import 'package:quizzing/screens/quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.startQuiz, this.userName, {super.key});
  final void Function() startQuiz;
  final void Function(String) userName;

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  void _startQuiz() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter Your Name'),
        content: TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        actions: [
          TextButton(
            
            onPressed: () {
              setState(() {
                widget.startQuiz();
                widget.userName(_controller.text);

                Navigator.of(context).pop();
              });
            },
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: const Color.fromRGBO(255, 255, 255, 0.3),
          ),
          const SizedBox(height: 30),
          const Text(
            'Ready to Start the Quiz?',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              _startQuiz();
            },
            label: const Text(
              'Start Quiz',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            icon: const Icon(Icons.play_arrow),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
