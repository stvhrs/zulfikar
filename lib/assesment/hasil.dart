import 'package:flutter/material.dart';

import 'package:zulfikar/assesment/model/quiz.dart';
import 'package:zulfikar/assesment/pdf.dart';

class Result extends StatefulWidget {
  final int correctAnswer;
  final int wrongAnser;
  final int waktu;
  final Color color;
  final String judul;
  final double points;
  final Quiz data;
  const Result(
      {super.key,
      required this.correctAnswer,
      required this.wrongAnser,
      required this.waktu,
      required this.color,
      required this.data,
      required this.judul,
      required this.points});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: widget.color,
          ),
        ),
        Positioned.fill(
            child: Image.asset(
          "asset/cahaya.png",
          fit: BoxFit.none,
        )),
        Scaffold(
            backgroundColor: Colors.transparent, // Background color
            body: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 48, bottom: 16),
                    child: Center(
                      child: Text(
                        widget.data.namaMapel,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(249, 249, 249, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 16,
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(249, 249, 249, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "asset/top.png",
                                color: widget.color,
                              ),
                            ),
                            Positioned(
                              child: Image.asset(
                                "asset/hore.png",
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.28,
                                height:
                                    MediaQuery.of(context).size.width * 0.28,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "asset/hai.png",
                                        )),
                                    color: widget.color,
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ],
                        ),
                        // Header section with confetti and owl image

                        const SizedBox(height: 12),
                        Text(
                          'Selamat! Kamu sudah\nmenyelesaikan ' + " Qr Soal",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            color: Color.fromARGB(255, 75, 75, 75),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 12),
                        Text(
                          textAlign: TextAlign.center,
                          widget.judul,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "${widget.points.floor()} Points",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 36,
                          children: [
                            Column(
                              children: [
                                Text(
                                  widget.correctAnswer.toString(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(60, 132, 97, 1),
                                  ),
                                ),
                                const Text(
                                  'Benar',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.wrongAnser.toString(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(183, 52, 44, 1)),
                                ),
                                const Text(
                                  'Salah',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "${widget.waktu}m",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(212, 182, 25, 1),
                                  ),
                                ),
                                const Text(
                                  'Waktu',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // "Ke beranda" button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: widget.color,
                              // primary: Color(0xFF00ACC1),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 40),
                              width: double.infinity,
                              child: const Text(
                                'Ke beranda',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(249, 249, 249, 1),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),

                        // "Lihat laporan" link
                        Container(
                          margin: const EdgeInsets.only(bottom: 12, top: 12),
                          child: TextButton.icon(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HalamanPDFSoalState(
                                        widget.data,)),
                              );
                            },
                            icon: Icon(
                              Icons.picture_as_pdf,
                              color: widget.color,
                            ),
                            label: Text(
                              'Lihat laporan',
                              style: TextStyle(
                                  color: widget.color,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ))
      ],
    );
  }
}
