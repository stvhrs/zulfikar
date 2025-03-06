import 'package:flutter/material.dart';

// Method 1: Using Custom PageRouteBuilder
class SlideRightToLeftRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightToLeftRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(1.0, 0.0); // Start from right
            const end = Offset.zero; // End at center
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

class _SlideRightToLeftBuilder extends PageTransitionsBuilder {
  const _SlideRightToLeftBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.fastOutSlowIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
var myTheme = ThemeData(  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: _SlideRightToLeftBuilder(),
      TargetPlatform.iOS: _SlideRightToLeftBuilder(),
    },
  ),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Color.fromRGBO(117, 177, 214, 1),
  colorScheme:
      ColorScheme.fromSeed(seedColor:  Color.fromRGBO(117, 177, 214, 1),),
  useMaterial3: true,
  fontFamily: 'Mulish',
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          backgroundColor: WidgetStatePropertyAll(
            Color.fromRGBO(117, 177, 214, 1),
          ))),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Color.fromRGBO(117, 177, 214, 1).withOpacity(0.5),
    errorStyle: const TextStyle(fontSize: 10), isDense: true,
    hintStyle:
        const TextStyle(color: Colors.grey), // Optional: Change hint color
    filled: true,
    fillColor: Colors.white, // Optional: Background color of the text field
    contentPadding:
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0), // Adjust the roundness
      borderSide: BorderSide.none, // Removes border line
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide:
          const BorderSide(color: Color.fromRGBO(215, 215, 215, 1), width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(
          color: Colors.red,
        )),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide:
          const BorderSide(color: Color.fromRGBO(215, 215, 215, 1), width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
          color: Color.fromRGBO(117, 177, 214, 1),
          width: 1.5), // Focused border color
    ),
  ),
);
