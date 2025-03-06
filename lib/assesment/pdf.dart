import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:zulfikar/assesment/generate_pdf.dart';

import 'package:zulfikar/assesment/model/quiz.dart';

class HalamanPDFSoalState extends StatefulWidget {
  final Quiz quiz;

  const HalamanPDFSoalState(this.quiz, {super.key});

  @override
  State<HalamanPDFSoalState> createState() => _HalamanPDFSoalStateState();
}

class _HalamanPDFSoalStateState extends State<HalamanPDFSoalState> {
  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  List optionsLetters = ["A.", "B.", "C.", "D.", "E."];
  @override
  void initState() {
    super.initState();
  }

  Uint8List? pdf;
  @override
  Widget build(BuildContext context) {
    log("pdf");
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.quiz.namaBab,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 15,
                        weight: 100,
                      ),
                    ),
                  )),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    pdf = await printAll(widget.quiz, "Zulfikar", "UNS");
                    var fileName = widget.quiz.namaBab.replaceAll("/", "-");

                    await Printing.sharePdf(
                      bytes: pdf!,
                      filename: fileName + ".pdf",
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ))
            ],
          ),
          backgroundColor: Colors.white,
          body: PdfPreview(
            loadingWidget: const Text('Loading...'),
            // onError: (context, error) => const Text('Error...'),
            maxPageWidth: MediaQuery.of(context).size.width,
            canDebug: false, allowPrinting: false, actions: const [],
            allowSharing: false,
            build: (format) async {
              return printAll(widget.quiz, "Zulfikar", "UNS");
            },
            onPrinted: _showPrintedToast,
            canChangeOrientation: false,
            canChangePageFormat: false,
            onShared: _showSharedToast,
          ),
        ));
  }
}
