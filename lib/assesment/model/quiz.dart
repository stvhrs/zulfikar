import 'dart:collection';

// Enum untuk menentukan tipe soal
enum QuestionType {
  essay,
  multipleChoice,
}

// Class WidgetQuestion
class WidgetQuestion {
  final String htmlText;
  final String pembahasan;
  final QuestionType type;
  final List<WiidgetOption> options;
  WiidgetOption? selectedWiidgetOption;
  final List<String>? keywords;
  final Map<String, double>? keywordWeights;
  String? userAnswer;

  WidgetQuestion({
    required this.htmlText,
    required this.pembahasan,
    required this.type,
    required this.options,
    this.selectedWiidgetOption,
    this.keywords,
    this.keywordWeights,
    this.userAnswer="",
  }) {
    if (type == QuestionType.multipleChoice && options.isEmpty) {
      throw Exception("Soal pilihan ganda harus memiliki opsi.");
    }
    if (type == QuestionType.essay) {
      if (keywords == null || keywords!.isEmpty) {
        throw Exception("Soal uraian harus memiliki kata kunci.");
      }
      if (keywordWeights == null || keywordWeights!.isEmpty) {
        throw Exception("Soal uraian harus memiliki bobot kata kunci.");
      }
      if (keywords!.length != keywordWeights!.length) {
        throw Exception("Jumlah kata kunci dan bobot harus sama.");
      }
      double totalWeight = keywordWeights!.values.reduce((a, b) => a + b);
      if (totalWeight > 100) {
        throw Exception("Total bobot kata kunci tidak boleh melebihi 100.");
      }
    }
    if (type == QuestionType.essay && options.isNotEmpty) {
      throw Exception("Soal uraian tidak boleh memiliki opsi.");
    }
  }

  double evaluateEssayAnswer() {
    if (type != QuestionType.essay) {
      throw Exception("Metode ini hanya untuk soal uraian.");
    }
    if (userAnswer == null || userAnswer!.isEmpty) {
      return 0.0;
    }

    String normalizedAnswer = userAnswer!.toLowerCase().replaceAll(RegExp(r'[.,]'), '');
    double score = 0.0;

    for (String keyword in keywords!) {
      if (normalizedAnswer.contains(keyword.toLowerCase())) {
        score += keywordWeights![keyword] ?? 0.0;
      }
    }

    return score > 100 ? 100.0 : score;
  }

  void displayQuestion() {
    print("Soal: $htmlText");
    print("Tipe: ${type.name}");
    print("Pembahasan: $pembahasan");
    if (type == QuestionType.multipleChoice) {
      print("Opsi:");
      for (int i = 0; i < options.length; i++) {
        print("${String.fromCharCode(97 + i)}. ${options[i].text}");
      }
      if (selectedWiidgetOption != null) {
        print("Jawaban terpilih: ${selectedWiidgetOption!.text}");
      }
    } else if (type == QuestionType.essay) {
      print("Kata kunci penilaian: $keywords");
      if (userAnswer != null) {
        print("Jawaban pengguna: $userAnswer");
        print("Skor: ${evaluateEssayAnswer()}/100");
      }
    }
    print("---");
  }
}

class WiidgetOption {
  final String? text;
  final bool? isCorrect;

  const WiidgetOption({
    this.text,
    this.isCorrect,
  });
}

class Quiz {
  final List<WidgetQuestion> questions;
  final String namaBab;
  final String namaMapel;
  final String kelas;

  Quiz({
    required this.questions,
    required this.namaBab,
    required this.namaMapel,
    this.kelas = "10",
  });
}

// Implementasi 40 Soal Pilihan Ganda dan 5 Soal Uraian
  List<WidgetQuestion> questions = [
    // A. Proses Sains: Menjelaskan Fenomena Sains
    WidgetQuestion(
      htmlText: "Energi terbarukan adalah energi yang...",
      pembahasan: "Energi terbarukan berasal dari sumber yang tidak akan habis, seperti matahari, angin, dan air.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Tidak dapat diperbarui", isCorrect: false),
        const WiidgetOption(text: "Berasal dari sumber yang tidak akan habis", isCorrect: true),
        const WiidgetOption(text: "Hanya digunakan di negara maju", isCorrect: false),
        const WiidgetOption(text: "Menghasilkan polusi tinggi", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Panel surya mengubah energi matahari menjadi...",
      pembahasan: "Panel surya mengubah energi matahari menjadi energi listrik melalui efek fotovoltaik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Energi kinetik", isCorrect: false),
        const WiidgetOption(text: "Energi listrik", isCorrect: true),
        const WiidgetOption(text: "Energi kimia", isCorrect: false),
        const WiidgetOption(text: "Energi panas", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Hukum Kekekalan Energi menyatakan bahwa...",
      pembahasan: "Hukum Kekekalan Energi menyatakan bahwa energi tidak dapat diciptakan atau dimusnahkan, hanya berubah bentuk.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Energi dapat diciptakan", isCorrect: false),
        const WiidgetOption(text: "Energi dapat dimusnahkan", isCorrect: false),
        const WiidgetOption(text: "Energi tidak dapat berubah bentuk", isCorrect: false),
        const WiidgetOption(text: "Energi tidak dapat diciptakan atau dimusnahkan", isCorrect: true),
      ],
    ),
    WidgetQuestion(
      htmlText: "Energi kinetik adalah energi yang dimiliki oleh benda karena...",
      pembahasan: "Energi kinetik adalah energi yang dimiliki benda karena geraknya.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Posisinya", isCorrect: false),
        const WiidgetOption(text: "Geraknya", isCorrect: true),
        const WiidgetOption(text: "Massanya", isCorrect: false),
        const WiidgetOption(text: "Bentuknya", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Energi potensial gravitasi bergantung pada...",
      pembahasan: "Energi potensial gravitasi bergantung pada massa dan ketinggian benda.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Massa dan kecepatan benda", isCorrect: false),
        const WiidgetOption(text: "Massa dan ketinggian benda", isCorrect: true),
        const WiidgetOption(text: "Kecepatan dan ketinggian benda", isCorrect: false),
        const WiidgetOption(text: "Bentuk dan ukuran benda", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Contoh perubahan energi pada turbin angin adalah...",
      pembahasan: "Turbin angin mengubah energi kinetik angin menjadi energi listrik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Energi listrik → energi kinetik", isCorrect: false),
        const WiidgetOption(text: "Energi kinetik → energi listrik", isCorrect: true),
        const WiidgetOption(text: "Energi kimia → energi listrik", isCorrect: false),
        const WiidgetOption(text: "Energi panas → energi listrik", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Energi mekanik adalah gabungan dari...",
      pembahasan: "Energi mekanik adalah gabungan energi potensial dan energi kinetik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Energi kinetik dan energi panas", isCorrect: false),
        const WiidgetOption(text: "Energi potensial dan energi kinetik", isCorrect: true),
        const WiidgetOption(text: "Energi listrik dan energi kimia", isCorrect: false),
        const WiidgetOption(text: "Energi panas dan energi listrik", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "PLTA mengubah energi potensial air menjadi...",
      pembahasan: "PLTA mengubah energi potensial air menjadi energi listrik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Energi kinetik", isCorrect: false),
        const WiidgetOption(text: "Energi listrik", isCorrect: true),
        const WiidgetOption(text: "Energi panas", isCorrect: false),
        const WiidgetOption(text: "Energi kimia", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Efisiensi panel surya dipengaruhi oleh...",
      pembahasan: "Efisiensi panel surya dipengaruhi oleh intensitas cahaya matahari.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Warna panel", isCorrect: false),
        const WiidgetOption(text: "Intensitas cahaya matahari", isCorrect: true),
        const WiidgetOption(text: "Kecepatan angin", isCorrect: false),
        const WiidgetOption(text: "Suhu udara", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Energi terbarukan yang memanfaatkan panas bumi adalah...",
      pembahasan: "Energi geotermal memanfaatkan panas bumi.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Energi angin", isCorrect: false),
        const WiidgetOption(text: "Energi biomassa", isCorrect: false),
        const WiidgetOption(text: "Energi geotermal", isCorrect: true),
        const WiidgetOption(text: "Energi air", isCorrect: false),
      ],
    ),

    // B. Proses Sains: Menggunakan Bukti Ilmiah
    WidgetQuestion(
      htmlText: "Bukti ilmiah yang mendukung penggunaan energi terbarukan adalah...",
      pembahasan: "Bukti ilmiah yang mendukung penggunaan energi terbarukan adalah menipisnya sumber energi fosil.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Meningkatnya polusi udara", isCorrect: false),
        const WiidgetOption(text: "Menipisnya sumber energi fosil", isCorrect: true),
        const WiidgetOption(text: "Menurunnya suhu global", isCorrect: false),
        const WiidgetOption(text: "Meningkatnya populasi dunia", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Data yang menunjukkan efisiensi panel surya adalah...",
      pembahasan: "Efisiensi panel surya diukur berdasarkan persentase energi matahari yang diubah menjadi listrik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Jumlah panel yang diproduksi", isCorrect: false),
        const WiidgetOption(text: "Persentase energi matahari yang diubah menjadi listrik", isCorrect: true),
        const WiidgetOption(text: "Harga panel surya di pasaran", isCorrect: false),
        const WiidgetOption(text: "Luas area pemasangan panel surya", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Bukti bahwa turbin angin ramah lingkungan adalah...",
      pembahasan: "Turbin angin ramah lingkungan karena tidak menghasilkan emisi gas rumah kaca.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Tidak menghasilkan emisi gas rumah kaca", isCorrect: true),
        const WiidgetOption(text: "Membutuhkan lahan yang luas", isCorrect: false),
        const WiidgetOption(text: "Menghasilkan suara bising", isCorrect: false),
        const WiidgetOption(text: "Memerlukan biaya pemeliharaan tinggi", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Energi terbarukan dianggap lebih berkelanjutan karena...",
      pembahasan: "Energi terbarukan berkelanjutan karena sumbernya tidak akan habis.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Sumbernya terbatas", isCorrect: false),
        const WiidgetOption(text: "Sumbernya tidak akan habis", isCorrect: true),
        const WiidgetOption(text: "Menghasilkan polusi tinggi", isCorrect: false),
        const WiidgetOption(text: "Biaya produksinya mahal", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Bukti ilmiah yang mendukung penggunaan PLTA adalah...",
      pembahasan: "PLTA dapat mengurangi risiko banjir dengan mengatur aliran air.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Menghasilkan emisi karbon", isCorrect: false),
        const WiidgetOption(text: "Mengurangi risiko banjir", isCorrect: true),
        const WiidgetOption(text: "Membutuhkan biaya konstruksi tinggi", isCorrect: false),
        const WiidgetOption(text: "Menyebabkan kerusakan ekosistem", isCorrect: false),
      ],
    ),

    // C. Proses Sains: Mengidentifikasi Pertanyaan Ilmiah
    WidgetQuestion(
      htmlText: "Pertanyaan ilmiah yang tepat tentang energi terbarukan adalah...",
      pembahasan: "Pertanyaan ilmiah yang tepat adalah tentang cara meningkatkan efisiensi panel surya.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Berapa harga panel surya di pasaran?", isCorrect: false),
        const WiidgetOption(text: "Bagaimana cara meningkatkan efisiensi panel surya?", isCorrect: true),
        const WiidgetOption(text: "Apakah energi terbarukan populer di masyarakat?", isCorrect: false),
        const WiidgetOption(text: "Berapa lama panel surya dapat bertahan?", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Pertanyaan yang dapat diajukan tentang turbin angin adalah...",
      pembahasan: "Pertanyaan yang relevan adalah tentang kecepatan angin yang dibutuhkan turbin.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Berapa kecepatan angin yang dibutuhkan untuk menghasilkan listrik?", isCorrect: true),
        const WiidgetOption(text: "Apakah turbin angin mahal?", isCorrect: false),
        const WiidgetOption(text: "Berapa jumlah turbin angin di dunia?", isCorrect: false),
        const WiidgetOption(text: "Apakah turbin angin menghasilkan suara bising?", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Pertanyaan ilmiah tentang PLTA adalah...",
      pembahasan: "Pertanyaan ilmiah tentang PLTA adalah dampaknya terhadap ekosistem sungai.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Bagaimana PLTA memengaruhi ekosistem sungai?", isCorrect: true),
        const WiidgetOption(text: "Berapa biaya pembangunan PLTA?", isCorrect: false),
        const WiidgetOption(text: "Apakah PLTA menghasilkan listrik yang stabil?", isCorrect: false),
        const WiidgetOption(text: "Berapa lama PLTA dapat beroperasi?", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Pertanyaan yang relevan tentang energi geotermal adalah...",
      pembahasan: "Pertanyaan yang relevan adalah tentang proses perubahan panas bumi menjadi listrik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Bagaimana panas bumi diubah menjadi energi listrik?", isCorrect: true),
        const WiidgetOption(text: "Apakah energi geotermal mahal?", isCorrect: false),
        const WiidgetOption(text: "Berapa banyak negara yang menggunakan energi geotermal?", isCorrect: false),
        const WiidgetOption(text: "Apakah energi geotermal ramah lingkungan?", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Pertanyaan yang dapat diajukan tentang energi biomassa adalah...",
      pembahasan: "Pertanyaan ilmiah tentang energi biomassa adalah proses perubahan limbah organik.",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "Bagaimana limbah organik diubah menjadi energi?", isCorrect: true),
        const WiidgetOption(text: "Berapa harga energi biomassa?", isCorrect: false),
        const WiidgetOption(text: "Apakah energi biomassa populer?", isCorrect: false),
        const WiidgetOption(text: "Berapa lama energi biomassa dapat bertahan?", isCorrect: false),
      ],
    ),

    // D. Konten Sains: Memahami Fenomena Sains
    WidgetQuestion(
      htmlText: "Energi kinetik sebuah mobil dengan massa 1000 kg dan kecepatan 20 m/s adalah...",
      pembahasan: "E_k = 1/2 × m × v² = 1/2 × 1000 × (20)² = 200.000 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "10.000 J", isCorrect: false),
        const WiidgetOption(text: "20.000 J", isCorrect: false),
        const WiidgetOption(text: "200.000 J", isCorrect: true),
        const WiidgetOption(text: "400.000 J", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Energi potensial sebuah benda dengan massa 5 kg dan ketinggian 10 m adalah...",
      pembahasan: "E_p = m × g × h = 5 × 9,8 × 10 = 490 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "50 J", isCorrect: false),
        const WiidgetOption(text: "100 J", isCorrect: false),
        const WiidgetOption(text: "490 J", isCorrect: true),
        const WiidgetOption(text: "500 J", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Jika efisiensi panel surya adalah 20%, berapa energi listrik yang dihasilkan dari 1000 J energi matahari?",
      pembahasan: "Energi listrik = 20% dari 1000 J = 200 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "20 J", isCorrect: false),
        const WiidgetOption(text: "200 J", isCorrect: true),
        const WiidgetOption(text: "500 J", isCorrect: false),
        const WiidgetOption(text: "1000 J", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Sebuah turbin angin mengubah energi kinetik angin menjadi energi listrik dengan efisiensi 30%. Jika energi kinetik angin adalah 1000 J, berapa energi listrik yang dihasilkan?",
      pembahasan: "Energi listrik = 30% dari 1000 J = 300 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "30 J", isCorrect: false),
        const WiidgetOption(text: "300 J", isCorrect: true),
        const WiidgetOption(text: "700 J", isCorrect: false),
        const WiidgetOption(text: "1000 J", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Energi mekanik sebuah benda dengan energi potensial 200 J dan energi kinetik 300 J adalah...",
      pembahasan: "Energi mekanik = E_p + E_k = 200 + 300 = 500 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "100 J", isCorrect: false),
        const WiidgetOption(text: "200 J", isCorrect: false),
        const WiidgetOption(text: "300 J", isCorrect: false),
        const WiidgetOption(text: "500 J", isCorrect: true),
      ],
    ),

    // E. Konteks Sains: Memecahkan Masalah
    WidgetQuestion(
      htmlText: "Jika sebuah panel surya menerima 5000 J energi matahari dan mengubahnya menjadi 1000 J energi listrik, berapa efisiensinya?",
      pembahasan: "Efisiensi = (1000 / 5000) × 100% = 20%",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "10%", isCorrect: false),
        const WiidgetOption(text: "20%", isCorrect: true),
        const WiidgetOption(text: "50%", isCorrect: false),
        const WiidgetOption(text: "100%", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Sebuah PLTA memiliki ketinggian air 50 m dan debit air 10 m³/s. Jika massa jenis air adalah 1000 kg/m³, berapa energi potensial air per detik?",
      pembahasan: "Energi potensial = m × g × h = (10 × 1000) × 9,8 × 50 = 4.900.000 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "500.000 J", isCorrect: false),
        const WiidgetOption(text: "1.000.000 J", isCorrect: false),
        const WiidgetOption(text: "2.500.000 J", isCorrect: false),
        const WiidgetOption(text: "5.000.000 J", isCorrect: true),
      ],
    ),
    WidgetQuestion(
      htmlText: "Sebuah turbin angin memiliki efisiensi 40%. Jika energi kinetik angin adalah 2000 J, berapa energi listrik yang dihasilkan?",
      pembahasan: "Energi listrik = 40% dari 2000 J = 800 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "400 J", isCorrect: false),
        const WiidgetOption(text: "800 J", isCorrect: true),
        const WiidgetOption(text: "1200 J", isCorrect: false),
        const WiidgetOption(text: "1600 J", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Jika sebuah benda dengan massa 2 kg diangkat hingga ketinggian 5 m, berapa usaha yang dilakukan? (g = 9,8 m/s²)",
      pembahasan: "W = m × g × h = 2 × 9,8 × 5 = 98 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "10 J", isCorrect: false),
        const WiidgetOption(text: "49 J", isCorrect: false),
        const WiidgetOption(text: "98 J", isCorrect: true),
        const WiidgetOption(text: "100 J", isCorrect: false),
      ],
    ),
    WidgetQuestion(
      htmlText: "Sebuah mobil dengan massa 1200 kg bergerak dengan kecepatan 15 m/s. Berapa energi kinetik mobil tersebut?",
      pembahasan: "E_k = 1/2 × 1200 × (15)² = 135.000 J",
      type: QuestionType.multipleChoice,
      options: [
        const WiidgetOption(text: "90.000 J", isCorrect: false),
        const WiidgetOption(text: "135.000 J", isCorrect: true),
        const WiidgetOption(text: "180.000 J", isCorrect: false),
        const WiidgetOption(text: "270.000 J", isCorrect: false),
      ],
    ),

    // 5 Soal Uraian
    WidgetQuestion(
      htmlText: "Sebutkan 5 contoh sumber energi terbarukan dan jelaskan bagaimana masing-masing sumber tersebut dapat dimanfaatkan dalam kehidupan sehari-hari!",
      pembahasan: "Contoh: Matahari (panel surya), Angin (turbin angin), Air (PLTA), Biomassa (biogas), Geotermal (panas bumi untuk listrik).",
      type: QuestionType.essay,
      options: [],
      keywords: ["matahari", "angin", "air", "biomassa", "geotermal", "panel surya", "turbin", "PLTA", "biogas", "listrik"],
      keywordWeights: {
        "matahari": 10, "angin": 10, "air": 10, "biomassa": 10, "geotermal": 10,
        "panel surya": 10, "turbin": 10, "PLTA": 10, "biogas": 10, "listrik": 10,
      },
    ),
    WidgetQuestion(
      htmlText: "Jika Anda diminta untuk merancang sebuah sistem energi terbarukan di daerah terpencil, sumber energi apa yang akan Anda pilih? Jelaskan alasan Anda dan bagaimana sistem tersebut akan bekerja!",
      pembahasan: "Pilihan sumber energi: Jika daerah terpencil memiliki aliran sungai, PLTA adalah pilihan terbaik. Jika daerah tersebut memiliki angin kencang, turbin angin dapat digunakan. Jika daerah tersebut memiliki sinar matahari yang melimpah, panel surya adalah solusi.",
      type: QuestionType.essay,
      options: [],
      keywords: ["sumber energi", "terpencil", "PLTA", "turbin angin", "panel surya", "alasan", "cara kerja"],
      keywordWeights: {
        "sumber energi": 15, "terpencil": 10, "PLTA": 15, "turbin angin": 15, "panel surya": 15,
        "alasan": 15, "cara kerja": 15,
      },
    ),
    WidgetQuestion(
      htmlText: "Buatlah sebuah ide inovatif untuk meningkatkan efisiensi panel surya dengan memanfaatkan teknologi atau bahan baru. Jelaskan konsep Anda secara detail!",
      pembahasan: "Ide inovatif: Menggunakan panel surya berbahan perovskit yang memiliki efisiensi lebih tinggi. Menambahkan sistem pelacak matahari (solar tracker) untuk meningkatkan penyerapan energi.",
      type: QuestionType.essay,
      options: [],
      keywords: ["panel surya", "efisiensi", "teknologi", "bahan baru", "perovskit", "solar tracker", "konsep"],
      keywordWeights: {
        "panel surya": 15, "efisiensi": 15, "teknologi": 10, "bahan baru": 10, "perovskit": 15,
        "solar tracker": 15, "konsep": 20,
      },
    ),
    WidgetQuestion(
      htmlText: "Jelaskan proses perubahan energi pada PLTA mulai dari air yang mengalir hingga menghasilkan listrik. Sertakan perhitungan energi potensial air jika diketahui massa air adalah 10.000 kg dan ketinggiannya 20 m (g = 9,8 m/s²)!",
      pembahasan: "Proses: Air dari waduk dialirkan melalui turbin. Energi potensial air diubah menjadi energi kinetik. Turbin menggerakkan generator untuk menghasilkan listrik. Perhitungan: E_p = m × g × h = 10.000 × 9,8 × 20 = 1.960.000 J.",
      type: QuestionType.essay,
      options: [],
      keywords: ["waduk", "turbin", "generator", "potensial", "kinetik", "listrik", "perhitungan", "1.960.000"],
      keywordWeights: {
        "waduk": 10, "turbin": 15, "generator": 15, "potensial": 10, "kinetik": 10,
        "listrik": 15, "perhitungan": 10, "1.960.000": 15,
      },
    ),
    WidgetQuestion(
      htmlText: "Bayangkan Anda adalah seorang ilmuwan yang ditugaskan untuk mengembangkan energi terbarukan di daerah pegunungan. Rancanglah sebuah sistem energi terbarukan yang memanfaatkan sumber daya alam di daerah tersebut. Jelaskan komponen, cara kerja, dan manfaat sistem tersebut!",
      pembahasan: "Sistem energi terbarukan di pegunungan: Menggunakan PLTA jika ada aliran sungai. Memanfaatkan energi angin dengan turbin angin. Menggunakan panel surya untuk daerah yang terkena sinar matahari. Sistem ini akan menghasilkan listrik yang stabil dan ramah lingkungan.",
      type: QuestionType.essay,
      options: [],
      keywords: ["pegunungan", "PLTA", "turbin angin", "panel surya", "komponen", "cara kerja", "manfaat", "ramah lingkungan"],
      keywordWeights: {
        "pegunungan": 10, "PLTA": 15, "turbin angin": 15, "panel surya": 15, "komponen": 10,
        "cara kerja": 15, "manfaat": 10, "ramah lingkungan": 10,
      },
    ),
  ];

  // Membuat Quiz
  Quiz asesmen = Quiz(
    questions: questions,
    namaBab: "Energi Terbarukan",
    namaMapel: "IPA",
    kelas: "10",
  );

  // // Contoh penggunaan
  // for (var question in asesmen.questions.take(5)) { // Hanya 5 pertama untuk demo
  //   question.displayQuestion();
  //   if (question.type == QuestionType.multipleChoice) {
  //     question.selectedWiidgetOption = question.options.firstWhere((opt) => opt.isCorrect!);
  //   } else if (question.type == QuestionType.essay) {
  //     if (question.htmlText.contains("5 contoh")) {
  //       question.userAnswer = "Matahari digunakan untuk panel surya, angin untuk turbin, air untuk PLTA, biomassa untuk biogas, geotermal untuk listrik.";
  //     } else if (question.htmlText.contains("PLTA")) {
  //       question.userAnswer = "Air dari waduk mengalir ke turbin, energi potensial menjadi kinetik, generator menghasilkan listrik. E_p = 10.000 × 9,8 × 20 = 1.960.000 J.";
  //     }
  //   }
  //   question.displayQuestion();
  // }