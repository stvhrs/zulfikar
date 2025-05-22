import 'package:flutter/material.dart';
import 'package:zulfikar/assesment/model/quiz.dart';

class ScienceState with ChangeNotifier {
  int _currentIndex = 0;
  Color color = Color.fromRGBO(235, 69, 8, 1);
  double pretest = 0;
  set setPretest(double val) {
    pretest = val;
    notifyListeners();
  }

  double posttest = 0;
  int get currentIndex => _currentIndex;
  Quiz data = Quiz(questions: [
    WidgetQuestion(
      htmlText: "Energi terbarukan adalah energi yang...",
      pembahasan:
          "Energi terbarukan berasal dari sumber yang tidak akan habis, seperti matahari, angin, dan air.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Tidak dapat diperbarui", isCorrect: false),
        const WiidgetOption(
            text: "Berasal dari sumber yang tidak akan habis", isCorrect: true),
        const WiidgetOption(
            text: "Hanya digunakan di negara maju", isCorrect: false),
        const WiidgetOption(
            text: "Menghasilkan polusi tinggi", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Panel surya mengubah energi matahari menjadi...",
      pembahasan:
          "Panel surya mengubah energi matahari menjadi energi listrik melalui efek fotovoltaik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Energi kinetik", isCorrect: false),
        const WiidgetOption(text: "Energi listrik", isCorrect: true),
        const WiidgetOption(text: "Energi kimia", isCorrect: false),
        const WiidgetOption(text: "Energi panas", isCorrect: false),
      ],
    ),
  ], namaBab: "Science", namaMapel: "Pre test");
  // Method untuk mengubah tab yang aktif
  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Memberi tahu listener (UI) bahwa ada perubahan state
  }
}
