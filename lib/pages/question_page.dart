import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/hasil_page.dart';

List<String> quiz = [
  "Perasaan berat di kepala",
  "Menjadi lelah seluruh tubuh",
  "Kaki merasa berat",
  "Menguap",
  "Merasa kacau pikiran",
  "Menjadi mengantuk",
  "Merasakan beban pada mata",
  "Kaku dan canggung dalam gerakan",
  "Tidak seimbang dalam berdiri",
  "Mau berbaring",
  "Merasa susah berfikir",
  "Lelah bicara",
  "Menjadi gugup",
  "Tidak dapat berkonsentrasi",
  "Sulit memusatkan perhatian",
  "Cenderung untuk lupa",
  "Kurang kepercayaan diri",
  "Cemas terhadap sesuatu",
  "Tidak dapat mengontrol sikap",
  "Tidak tekun dalam kerja",
  "Tidak dapat tekun dalam pekerjaan",
  "Sakit kepala",
  "Kekakuan di bahu",
  "Merasa nyeri di punggung",
  "Merasa pernafasan tertekan",
  "Haus",
  "Suara serak",
  "Merasa pening",
  "Tremor pada anggota badan",
  "Merasa kurang sehat",
];

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int startIndex = 0;
  List<String?> answers = List.generate(quiz.length, (index) => null);
  int totalScore = 0;

  bool allQuestionsAnswered() {
    return answers.where((answer) => answer != null).length == quiz.length;
  }

  void nextPage() {
    if (startIndex + 5 >= quiz.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HasilPage(
            totalNilai: totalScore.toString(),
          ),
        ),
      );
    }
  }

  void saveAnswer(int index, String value) {
    setState(() {
      answers[index] = value;
      totalScore = calculateTotalScore();

      int batchStart = startIndex;
      int batchEnd =
          (startIndex + 5) < quiz.length ? startIndex + 5 : quiz.length;

      bool allBatchAnswered = answers
          .sublist(batchStart, batchEnd)
          .every((answer) => answer != null);

      if (allBatchAnswered && batchEnd < quiz.length) {
        startIndex += 5;
      }
    });
  }

  int calculateTotalScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer != null) {
        score += int.parse(answer);
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentQuiz = quiz.sublist(startIndex,
        (startIndex + 5) < quiz.length ? startIndex + 5 : quiz.length);

    return Scaffold(
      backgroundColor: const Color(0xff7B6DE4),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: currentQuiz.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 315,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: const Color(0xffCABBEF),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Text(
                            "${startIndex + index + 1}. ${currentQuiz[index]}",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Options(
                          index: startIndex + index,
                          onChanged: saveAnswer,
                          selectedAnswer: answers[startIndex + index],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: nextPage,
        icon: const Icon(
          Icons.arrow_forward_outlined,
          size: 52,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Options extends StatefulWidget {
  final int index;
  final Function(int, String) onChanged;
  final String? selectedAnswer;

  const Options({
    required this.index,
    required this.onChanged,
    required this.selectedAnswer,
    super.key,
  });

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioOption(
          value: "1",
          groupValue: widget.selectedAnswer,
          onChanged: (value) {
            setState(() {
              widget.onChanged(widget.index, value!);
            });
          },
        ),
        RadioOption(
          value: "2",
          groupValue: widget.selectedAnswer,
          onChanged: (value) {
            setState(() {
              widget.onChanged(widget.index, value!);
            });
          },
        ),
        RadioOption(
          value: "3",
          groupValue: widget.selectedAnswer,
          onChanged: (value) {
            setState(() {
              widget.onChanged(widget.index, value!);
            });
          },
        ),
        RadioOption(
          value: "4",
          groupValue: widget.selectedAnswer,
          onChanged: (value) {
            setState(() {
              widget.onChanged(widget.index, value!);
            });
          },
        ),
      ],
    );
  }
}

class RadioOption extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const RadioOption({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: Colors.white,
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (states) => Colors.white,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
