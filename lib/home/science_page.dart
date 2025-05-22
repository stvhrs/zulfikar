import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zulfikar/home/pre_test_science.dart';
import 'package:zulfikar/state/science_state.dart';

class SciencePage extends StatefulWidget {
  @override
  _SciencePageState createState() => _SciencePageState();
}

class _SciencePageState extends State<SciencePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController
    final scienceState = Provider.of<ScienceState>(context, listen: false);
    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: scienceState.currentIndex,
    );

    // Listen for tab index changes and update the state
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        scienceState.setCurrentIndex(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController
        .dispose(); // Dispose of the TabController to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScienceState>(builder: (context, scienceState, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Science - Energi dan Energi Terbarukan'),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: TabBar(
                  labelColor:scienceState.color,
                  indicatorColor: scienceState.color,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true, // Makes the TabBar scrollable
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'Pre Test'),
                    Tab(text: 'Energi dalam Fisika'),
                    Tab(text: 'Konsep Energi Kinetik'),
                    Tab(text: 'Konsep Energi Potensial Gravitasi'),
                    Tab(text: 'Energi Potensial Pegas'),
                    Tab(text: 'Pertanyaan Pemantik'),
                  ],
                )),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              PreTestScience(),
              ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Text(
                    'ENERGI DALAM FISIKA',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Energi adalah kemampuan untuk melakukan usaha atau menyebabkan perubahan...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              // Tab 2: Konsep Energi Kinetik
              ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Text(
                    'Konsep Energi Kinetik',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Energi kinetik adalah energi yang dimiliki oleh benda akibat pergerakannya...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              // Tab 3: Konsep Energi Potensial Gravitasi
              ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Text(
                    'Konsep Energi Potensial Gravitasi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Energi potensial gravitasi adalah energi yang dimiliki suatu benda karena posisinya terhadap permukaan bumi...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              // Tab 4: Energi Potensial Pegas
              ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Text(
                    'Energi Potensial Pegas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Energi potensial pegas adalah energi yang tersimpan dalam benda pegas ketika benda itu diregangkan atau ditekan...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              // Tab 5: Pertanyaan Pemantik
              ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  Text(
                    'Pertanyaan Pemantik',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '📘 Menjelaskan Fenomena Saintifik\n'
                    '1. Mengapa kamu merasa lebih sulit menghentikan mobil mainan yang bergerak cepat daripada yang lambat?\n\n'
                    '📈 Menafsirkan Data dan Bukti Ilmiah\n'
                    '2. Jika dua benda memiliki massa yang sama tapi kecepatan berbeda, dari data pengamatan mana kamu bisa tahu mana yang lebih berenergi?\n\n',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ));
    });
  }
}
