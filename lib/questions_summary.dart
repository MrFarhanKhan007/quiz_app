import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Row(
                  children: [
                    Text(
                      ((data["question_index"] as int) + 1).toString(),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data["question"] as String,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data["correct_answer"] as String,
                              textAlign: TextAlign.left),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data["user_answer"] as String,
                              textAlign: TextAlign.left),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
