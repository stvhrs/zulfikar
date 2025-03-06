import 'package:flutter/material.dart';
import 'package:zulfikar/home/widgets/custom_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SizedBox(width: MediaQuery.of(context).size.width*0.7,
        child: Drawer(
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Row(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(right: 12,left: 4),
                    child: Icon(Icons.school_outlined,color: Colors.grey.shade700,size: 16,),
                  ),Text("Pendekatan STEAM",style: TextStyle(fontSize: 16,color: Colors.grey.shade700,),),
            ])),
              Divider(),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Row(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(right: 12,left: 4),
                    child: Icon(Icons.flag_outlined,color: Colors.grey.shade700,size: 16,),
                  ),Text("Capaian Belajar",style: TextStyle(fontSize: 16,color: Colors.grey.shade700,),),
             
            ])), Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(right: 12,left: 4),
                    child: Icon(Icons.near_me_outlined,color: Colors.grey.shade700,size: 16,),
                  ),Text("Alur Tujuan Pembelajaran",style: TextStyle(fontSize: 16,color: Colors.grey.shade700,),),
            ])),
              Divider(),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(right: 12,left: 4),
                    child: Icon(Icons.sign_language_outlined,color: Colors.grey.shade700,size: 16,),
                  ),
                    Text("Petunjuk Pengunaan",style: TextStyle(fontSize: 16,color: Colors.grey.shade700,),),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Padding(
                    padding: const EdgeInsets.only(right: 12,left: 4),
                    child: Icon(Icons.info_outline_rounded,color: Colors.grey.shade700,size: 16,),
                  ),
                    Text("Tentang Aplikasi",style: TextStyle(fontSize: 16,color: Colors.grey.shade700,),),
                  ],
                ),
              ),
              Divider(),
            ],
          )),
        ),
      ),
      appBar: AppBar(elevation: 0,
        backgroundColor:
            Color.from(alpha: 1, red: 0.459, green: 0.694, blue: 0.839),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ));
          })
        ],
      ),
      body: Stack(
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
              Image.asset(
                "asset/6.png",
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: GridView.count(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: CustomButton(),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: CustomButton2()),
                    ],
                  ),
                ),
              ),
              Stack(
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
                        opacity: 0.8, child: Image.asset("asset/Bg Home.png")),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
