import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeoutScreen extends StatelessWidget {
  const TimeoutScreen({super.key, required this.onRestart});
  final void Function() onRestart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Please Try again",
            style: GoogleFonts.lato(
              color: Color.fromARGB(255, 230, 200, 253),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/time.png',
              height: 300,
              width: 300,
            ),
          ),
          ElevatedButton.icon(
            onPressed: onRestart,
            label: const Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 17),
            ),
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
    );
  }
}
