import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zulfikar/assesment/hasil.dart';
import 'package:zulfikar/assesment/model/quiz.dart';
import 'package:zulfikar/state/science_state.dart';

class CbtPreTestScience extends StatefulWidget {
  final Quiz data;
  const CbtPreTestScience({
    super.key,
    required this.data,
  });

  @override
  State<CbtPreTestScience> createState() => _AssesmenState();
}

class _AssesmenState extends State<CbtPreTestScience> {
  Quiz? data;
  int _questionNumber = 1;
  PageController _controller = PageController();
  List optionsLetters = ["A.", "B.", "C.", "D.", "E."];
  List<WiidgetOption> listSelectedOption = [];

  @override
  void initState() {
    data = widget.data;
    if (mounted) {
      startTimer();
    }

    super.initState();
    _controller = PageController(initialPage: 0);
  }

  int counter = 0; // Counter value
  Timer? timer; // Timer instance

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter++;
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        log("will");

        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(25),
            color: const Color.fromRGBO(249, 249, 249, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (_questionNumber > 1) {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        setState(() {
                          _questionNumber--;
                        });
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.orange),
                      fixedSize: WidgetStateProperty.all(
                        Size(MediaQuery.sizeOf(context).width * 0.40, 40),
                      ),
                      elevation: WidgetStateProperty.all(4),
                    ),
                    child: Text(
                      _questionNumber == 1 ? "Kembali" : 'Sebelumnya',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color.fromRGBO(249, 249, 249, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                    )),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        (data!.questions[_questionNumber - 1].type ==
                                        QuestionType.multipleChoice &&
                                    data!.questions[_questionNumber - 1]
                                            .selectedWiidgetOption ==
                                        null ||
                                data!.questions[_questionNumber - 1].type ==
                                        QuestionType.essay &&
                                    data!.questions[_questionNumber - 1]
                                        .userAnswer!.isEmpty)
                            ? Colors.grey
                            : _questionNumber < data!.questions.length
                                ? Theme.of(context).primaryColor
                                : Colors.green),
                    fixedSize: WidgetStateProperty.all(
                      Size(MediaQuery.sizeOf(context).width * 0.40, 40),
                    ),
                    elevation: WidgetStateProperty.all(4),
                  ),
                  onPressed: (data!.questions[_questionNumber - 1].type ==
                                  QuestionType.multipleChoice &&
                              data!.questions[_questionNumber - 1]
                                      .selectedWiidgetOption ==
                                  null ||
                          data!.questions[_questionNumber - 1].type ==
                                  QuestionType.essay &&
                              data!.questions[_questionNumber - 1].userAnswer!
                                  .isEmpty)
                      ? null
                      : () {
                          if (_questionNumber < data!.questions.length) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            setState(() {
                              _questionNumber++;
                            });
                          } else {
                            int correct = data!.questions
                                .where(
                                  (element) => (element.type ==
                                          QuestionType.multipleChoice &&
                                      element
                                          .selectedWiidgetOption!.isCorrect!),
                                )
                                .toList()
                                .length;
                            int wrong = data!.questions
                                .where(
                                  (element) => (element.type ==
                                          QuestionType.multipleChoice &&
                                      element.selectedWiidgetOption!
                                              .isCorrect ==
                                          false),
                                )
                                .toList()
                                .length;

                            Provider.of<ScienceState>(context, listen: false)
                                .setPretest = (correct / (correct + wrong)*100);
                            Navigator.of(context).pop();
                          }
                        },
                  child: Text(
                    _questionNumber < data!.questions.length
                        ? 'Selanjutnya'
                        : 'Lihat Hasil',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: const Color.fromRGBO(249, 249, 249, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(left: 0, right: 0, top: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, bottom: 5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color.fromRGBO(249, 249, 249, 1),
                                  size: 20,
                                  weight: 100,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              data?.namaBab ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: const Color.fromRGBO(
                                          249, 249, 249, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRect(
                    clipper: const ClipPad(padding: EdgeInsets.only(top: 30)),
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: const Color.fromRGBO(249, 249, 249, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.24),
                            blurRadius: 10.0,
                            offset: const Offset(10.0, 0),
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            "Pertanyaan  $_questionNumber/${data?.questions.length ?? "0"}",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: const Color.fromRGBO(249, 249, 249, 1),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: PageView.builder(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            itemCount: data!.questions.length,
            onPageChanged: (value) {
              // setState(() {
              _questionNumber = value + 1;

              // });
            },
            itemBuilder: (context, index) {
              final WidgetQuestion myquestions = data!.questions[index];
              if (myquestions.type == QuestionType.essay) {
                return ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    Text(
                      myquestions.htmlText,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextFormField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: "Jawaban",
                        ),
                        initialValue:
                            data!.questions[_questionNumber - 1].userAnswer,
                        onChanged: (v) {
                          data!.questions[_questionNumber - 1].userAnswer = v;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                );
              }
              return ListView(padding: const EdgeInsets.all(8.0), children: [
                Text(
                  myquestions.htmlText,
                ),
                const SizedBox(
                  height: 25,
                ),
                ...myquestions.options.map((e) {
                  var color = Colors.grey.shade200;

                  var questionOption = e;
                  String letters =
                      optionsLetters[myquestions.options.indexOf(e)];

                  return (questionOption.text!.isEmpty && letters == "E." ||
                          questionOption.text!.isEmpty && letters == "D.")
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            data!.questions[_questionNumber - 1]
                                .selectedWiidgetOption = questionOption;
                            setState(() {
                              myquestions.selectedWiidgetOption =
                                  questionOption;
                              data!.questions[_questionNumber - 1]
                                  .selectedWiidgetOption = questionOption;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.3,
                                  color: myquestions.selectedWiidgetOption ==
                                          questionOption
                                      ? Colors.green
                                      : color),
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      letters,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 4),
                                        child: Text(questionOption.text!)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                }),
              ]);
            },
          ),
        ),
      ),
    );
  }
}

class ClipPad extends CustomClipper<Rect> {
  final EdgeInsets padding;

  const ClipPad({this.padding = EdgeInsets.zero});

  @override
  Rect getClip(Size size) => padding.inflateRect(Offset.zero & size);

  @override
  bool shouldReclip(ClipPad oldClipper) => oldClipper.padding != padding;
}
