

// // import 'package:example/pagination.dart';

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:searchfield/searchfield.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       theme: ThemeData(
//         colorSchemeSeed: Colors.indigo,
//         useMaterial3: true,
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         colorSchemeSeed: Colors.blue,
//         useMaterial3: true,
//         brightness: Brightness.dark,
//       ),
//       home: SearchFieldSample(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class SearchFieldSample extends StatefulWidget {
//   const SearchFieldSample({Key? key}) : super(key: key);

//   @override
//   State<SearchFieldSample> createState() => _SearchFieldSampleState();
// }

// class _SearchFieldSampleState extends State<SearchFieldSample> {
//   @override
//   void initState() {
//     suggestions = [
//       'United States',
//       'Germany',
//       'Canada',
//       'United Kingdom',
//       'France',
//       'Italy',
//       'Spain',
//       'Australia',
//       'India',
//       'China',
//       'Japan',
//       'Brazil',
//       'South Africa',
//       'Mexico',
//       'Argentina',
//       'Russia',
//       'Indonesia',
//       'Turkey',
//       'Saudi Arabia',
//       'Nigeria',
//       'Egypt',
//     ];
//     selectedValue = SearchFieldListItem<String>(
//       'United States',
//       item: 'United States',
//     );
//     super.initState();
//   }
// FocusNode fd=FocusNode();
// FocusNode fdx=FocusNode();

//   var suggestions = <String>[];
//   late SearchFieldListItem<String> selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     Widget searchChild(x, {bool isSelected = false}) => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Text(x,
//               style: TextStyle(
//                   fontSize: 18, color: isSelected ? Colors.green : null)),
//         );
//     return Scaffold(
//         appBar: AppBar(title: Text('Searchfield Demo')),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             spacing: 20,
//             children: [
//               TextFormField(focusNode: fdx,textInputAction: TextInputAction.next,),
//               SearchField(textInputAction: TextInputAction.next,
//                 onSubmit: (p){
//                   log("submit");
//                   fd.requestFocus();
//                 },
//                 onSaved: (p0) {
//                   log("submit");

//                 fd.requestFocus();
//               },
//                 hint: 'Basic SearchField',
//                 // dynamicHeight: true,
//                 maxSuggestionBoxHeight: 300,
//                 onSuggestionTap: (SearchFieldListItem<String> item) {
//                   setState(() {
//                     selectedValue = item;
//                     fd.requestFocus();
//                   });
//                 },
//                 selectedValue: selectedValue,
//                 suggestions: suggestions.map(
//                   (x) {
//                     final t = SearchFieldListItem<String>(
//                       x,
//                       item: x,
//                       child: InkWell(onTap: (){
//                         log("item");
//                 fd.requestFocus();

//                       },
//                         child: searchChild(x,
//                             isSelected: selectedValue.searchKey == x),
//                       ),
//                     );

//                     return t;
//                   },
//                 ).toList(),
//                 suggestionState: Suggestion.expand,
//               ),
//               TextFormField(focusNode: fd,textInputAction: TextInputAction.next,),
//               TextFormField(textInputAction: TextInputAction.next,),

//  ElevatedButton(child: Text("data"),onPressed: (){
                  
//                 },),
              
//               Focus(canRequestFocus: false,onFocusChange: (f){
//                 fdx.requestFocus();
//               },
//                 child: ElevatedButton(child: Text("data"),onPressed: (){
                  
//                 },),
//               ),
              
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:zulfikar/home/home.dart';
import 'package:zulfikar/state/science_state.dart';
import 'package:zulfikar/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zulfikar',
      theme: myTheme,
      home: ChangeNotifierProvider(
      create: (context) => ScienceState(),
      child: MyApp(),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset("asset/login.png"),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                    child: FlutterCarousel(
                        options: FlutterCarouselOptions(
                          disableCenter: true,
                          indicatorMargin: 0,
                          aspectRatio: 1.12,
                          onPageChanged: (index, reason) {},
                          viewportFraction: 1,
                          pageSnapping: true,
                          autoPlay: false,
                          showIndicator: true,
                          floatingIndicator: true,
                          enableInfiniteScroll: false,
                          slideIndicator: CircularSlideIndicator(
                              slideIndicatorOptions: SlideIndicatorOptions(
                                  itemSpacing: 10,
                                  padding: const EdgeInsets.only(bottom: 30),
                                  indicatorRadius: 3.5,
                                  haloPadding: const EdgeInsets.all(0),
                                  indicatorBackgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  currentIndicatorColor:
                                      Colors.white.withOpacity(0.7))),
                        ),
                        items: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "asset/2.png",
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(
                                "Modul Elektronik",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            textAlign: TextAlign.center,
                            "Dengan pendekatan STEAM dan model  \npembelajaran PjBL",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "asset/1.png",
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(
                                "CP & ATP",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            textAlign: TextAlign.center,
                            "Sesuai dengan standar kemendikbud\nberbasis Pembelajaran Mendalam (PM)",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "asset/3.png",
                            width: MediaQuery.of(context).size.width * 1,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(
                                "Fitur Pembelajaran",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            textAlign: TextAlign.center,
                            "Video, CBT, Aktivitas interaktif berbasis proyek ",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ])),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                height: 15,
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                    "asset/doodle.png",
                  )),
                  color:Colors.grey.shade50,
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          bottom: 10, top: 0, left: 20, right: 20),
                      child: Text(
                        textAlign: TextAlign.left,
                        "Masukan data diri",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextFormField(
                      onChanged: (v) {
                        setState(() {});
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          prefixIcon: Icon(
                            Icons.person_2_sharp,
                            size: 18,
                          )),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          hintText: "Asal Sekolah",
                          prefixIcon: Icon(
                            Icons.school_rounded,
                            size: 18,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "Lanjutkan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Mulish"),
                          ),
                        )),
                  ),
                  Spacer(),
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
