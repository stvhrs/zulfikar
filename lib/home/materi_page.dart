import 'package:flutter/material.dart';
import 'package:zulfikar/home/science_page.dart';
import 'package:zulfikar/home/widgets/steam_button.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 2000,
                width: 2000,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(117, 177, 214, 1),
                    Color.fromRGBO(117, 177, 214, 1),
                    Color.fromRGBO(193, 229, 252, 1),
                    Colors.white
                  ],
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Opacity(opacity: 0.1,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3, bottom: 2),
                          child: Opacity(
                              opacity: 1,
                              child: Image.asset(
                                "asset/Bg Home.png",
                                color: Colors.white,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Opacity(
                              opacity: 0.8,
                              child: Image.asset("asset/Bg Home.png")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Modul Interaktif",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset("asset/3.png"),
                ),
                SteamButton(
                    img: "asset/s.png",color: Color.fromRGBO(235, 69, 8, 1),
                    number: "1",
                    steam: "Science",
                    widget: SciencePage()),
                SteamButton(
                    img: "asset/t.png",color: Color.fromRGBO(50, 125, 14,1),
                    number: "2",
                    steam: "Technology",
                    widget: SciencePage()),
                SteamButton(
                    img: "asset/e.png",color: Color.fromRGBO(7, 133, 182,1),
                    number: "3",
                    steam: "Enginenering",
                    widget: SciencePage()),
                SteamButton(
                    img: "asset/a.png",
                    number: "4",color: Color.fromRGBO(92, 203, 199, 1),
                    steam: "Art",
                    widget: SciencePage()),
                SteamButton(
                    img: "asset/m.png",color: Color.fromRGBO(255, 211, 44, 1),
                    number: "5",
                    steam: "Math",
                    widget: SciencePage())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
