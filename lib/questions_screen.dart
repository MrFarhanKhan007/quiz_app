import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.chooseAnswer, super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currQuesIndex = 0;
  answerQuestion(String selectedAnswer) {
    widget.chooseAnswer(selectedAnswer);
    setState(() {
      currQuesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currQues = questions[currQuesIndex];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currQues.text,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 201, 153, 253),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currQues.getShuffleAnswers().map(
                    (answers) => Answerbutton(
                        answerText: answers,
                        onTap: () {
                          answerQuestion(answers);
                        }),
                  )
            ]),
      ),
    );
  }
}
