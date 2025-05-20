import 'package:flutter/material.dart';

class SteamButton extends StatefulWidget {
  final String steam;
  final String img;
  final String number;
  final Widget widget;
  final Color color;
  const SteamButton(
      {required this.img,
      required this.number,required this.color,
      required this.steam,
      required this.widget});

  @override
  State<SteamButton> createState() => _SteamButtonState();
}

class _SteamButtonState extends State<SteamButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => widget.widget,
            ));
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.22,
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsetsDirectional.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.1), // Shadow color with some transparency
                      spreadRadius: 2, // The spread of the shadow
                      blurRadius: 5, // The blur radius of the shadow
                      offset: Offset(
                          0, 4), // Horizontal and vertical offset of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(
                        widget.img,
                      ),
                      fit: BoxFit.cover)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(" " + widget.steam,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: widget.color,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
      ],
    );
  }
}
