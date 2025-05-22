import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zulfikar/assesment/model/quiz.dart';
import 'package:zulfikar/assesment/pdf.dart';
import 'package:zulfikar/home/cbt_science.dart';
import 'package:zulfikar/state/science_state.dart';

class PreTestScience extends StatefulWidget {
  @override
  State<PreTestScience> createState() => _PreTestScienceState();
}

class _PreTestScienceState extends State<PreTestScience> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<ScienceState>(builder: (context, scienceState, child) {
      return Scaffold(
          backgroundColor: Colors.transparent, // Background color
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: EdgeInsets.only(bottom: 32),
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
                            color: scienceState.color,
                          ),
                        ),
                     scienceState.pretest<=0?SizedBox() : Positioned(
                          child: Image.asset(
                            "asset/hore.png",
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.width * 0.28,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "asset/hai.png",
                                    )),
                                color: scienceState.color,
                                shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    // Header section with confetti and owl image

                    const SizedBox(height: 12),
                    Text(
                      scienceState.pretest == 0
                          ? "Kerjakan Pretest Terlebih Dahulu"
                          : 'Selamat! Kamu sudah\nmenyelesaikan' + " Pretest Science",
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
                      "Pre Test Science",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    scienceState.pretest == 0
                        ? SizedBox()
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: scienceState.color,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "${scienceState.pretest.toInt()} Points",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  scienceState.pretest<=0?SizedBox():  const SizedBox(height: 24),

                    scienceState.pretest<=0?SizedBox():   const SizedBox(height: 24),

                    // "Ke beranda" button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CbtPreTestScience(data: scienceState.data,),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: scienceState.color,
                          // primary: Color(0xFF00ACC1),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 40),
                          width: double.infinity,
                          child: Text(
                            scienceState.pretest == 0
                                ? "Mulai Kerjakan"
                                : 'Ulangi',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(249, 249, 249, 1),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),

                    // "Lihat laporan" link
                    scienceState.pretest == 0
                        ? SizedBox()
                        : Container(
                            margin: const EdgeInsets.only(bottom: 12, top: 12),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HalamanPDFSoalState(
                                            scienceState.data,
                                          )),
                                );
                              },
                              icon: Icon(
                                Icons.picture_as_pdf,
                                color: scienceState.color,
                              ),
                              label: Text(
                                'Lihat Pembahasan',
                                style: TextStyle(
                                    color: scienceState.color,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
