import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:zulfikar/assesment/asssment.dart';
import 'package:zulfikar/assesment/model/quiz.dart';

class CustomButton extends StatefulWidget {
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  static const double _shadowHeight = 4;
  double _position = 4;

  Color lightenColor(Color color, [double amount = 0.15]) {
    // Use Color.lerp to mix the color with white
    return Color.lerp(color, Colors.white, amount)!;
  }

  @override
  Widget build(BuildContext context) {
    const double height = 64 - _shadowHeight;
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: GestureDetector(
            onTap: () async {
              setState(() {
                _position = 0;
              });
              await Future.delayed(const Duration(milliseconds: 70));
              setState(() {
                _position = 4;
              });
              await Future.delayed(const Duration(milliseconds: 70));
            },
            onTapUp: (_) {
              setState(() {
                _position = 4;
              });
            },
            onTapDown: (_) {
              setState(() {
                _position = 0;
              });
            },
            onTapCancel: () {
              setState(() {
                _position = 4;
              });
            },
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "asset/materi.png",
                      color: Color.fromRGBO(157, 68, 16, 1),
                    ),
                  )),
              AnimatedPositioned(
                  curve: Curves.easeIn,
                  bottom: _position,
                  top: -_position,
                  left: 0,
                  right: 0,
                  duration: const Duration(milliseconds: 70),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "asset/materi.png",
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Shimmer(
                                duration: Duration(seconds: 2), //Default value
                                interval: Duration(
                                    seconds:
                                        2), //Default value: Duration(seconds: 0)
                                color: Colors.white, //Default value
                                colorOpacity: 0.3, //Default value

                                enabled: true, //Default value
                                direction:
                                    ShimmerDirection.fromLTRB(), //Default Value
                                child: Image.asset(
                                  "asset/materi.png",
                                ),
                              )),
                        ],
                      )))
            ])));
  }
}
// ShaderMask(
// shaderCallback: (rectangle) {
// return LinearGradient(stops: [5,1],
// colors: [Colors.black, Colors.transparent],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter
// ).createShader (Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
// },
// blendMode: BlendMode.dstIn,

class CustomButton2 extends StatefulWidget {
  @override
  State<CustomButton2> createState() => _CustomButtonState2();
}

class _CustomButtonState2 extends State<CustomButton2> {
  @override
  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    const double height = 64 - _shadowHeight;
    return GestureDetector(
        onTap: () async {
          setState(() {
            _position = 0;
          });
          await Future.delayed(const Duration(milliseconds: 70));
          setState(() {
            _position = 4;
          });
          await Future.delayed(const Duration(milliseconds: 70));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Assesmen(
                  color: Colors.blue,
                  data: asesmen)));
        },
        onTapUp: (_) {
          setState(() {
            _position = 4;
          });
        },
        onTapDown: (_) {
          setState(() {
            _position = 0;
          });
        },
        onTapCancel: () {
          setState(() {
            _position = 4;
          });
        },
        child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      height: height,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "asset/asesmen.png",
                          color: Color.fromRGBO(142, 2, 2, 1),
                        ),
                      ))),
              AnimatedPositioned(
                  curve: Curves.easeIn,
                  bottom: _position,
                  top: -_position,
                  left: 0,
                  right: 0,
                  duration: const Duration(milliseconds: 70),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "asset/asesmen.png",
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Shimmer(
                                duration: Duration(seconds: 2), //Default value
                                interval: Duration(
                                    seconds:
                                        2), //Default value: Duration(seconds: 0)
                                color: Colors.white, //Default value
                                colorOpacity: 0.3, //Default value

                                enabled: true, //Default value
                                direction:
                                    ShimmerDirection.fromLTRB(), //Default Value
                                child: Image.asset(
                                  "asset/asesmen.png",
                                ),
                              )),
                        ],
                      )))
            ]));
  }
}
// ShaderMask(
// shaderCallback: (rectangle) {
// return LinearGradient(stops: [5,1],
// colors: [Colors.black, Colors.transparent],
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter
// ).createShader (Rect.fromLTRB(0, 0, rectangle.width, rectangle.height)); 
// },
// blendMode: BlendMode.dstIn,