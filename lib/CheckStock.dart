
import 'package:flutter/material.dart';
import 'package:teknolojirenault/main.dart';
const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);
class Stokkontrol extends StatefulWidget{
  const Stokkontrol ({Key? key}) : super (key: key);
  @override
  _StokkontrolState createState() => _StokkontrolState();
}

class _StokkontrolState extends State<Stokkontrol> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Stok Kontrol',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = const [
  Text('eco', style: _textStyle),
      Text('home', style: _textStyle),
  Text('person', style: _textStyle),
  Text('video', style: _textStyle),];
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Kış Lastiği", "age": 29},
    {"id": 2, "name": "Hava Filtresi", "age": 40},
    {"id": 3, "name": "Polen Filtresi", "age": 5},
    {"id": 4, "name": "Dört Mevsim Lastik", "age": 35},
    {"id": 5, "name": "Fren Hidroliği", "age": 21},
    {"id": 6, "name": "Cam Suyu", "age": 55},
    {"id": 7, "name": "Ön Balata", "age": 30},
    {"id": 8, "name": "Arka Balata", "age": 14},
    {"id": 9, "name": "Motor Yağı", "age": 100},
    {"id": 10, "name": "Yaz Lastiği", "age": 32},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Anasayfa')));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Stok Kontrol"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Ürün Ara', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child:
              _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundUsers[index]['name']),
                    subtitle: Text(
                        '${_foundUsers[index]["age"].toString()} tane kaldı.'),
                  ),
                ),
              )
                  : const Text(
                'Sonuç Bulunamadı',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),

     /* bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.eco),
            icon: Icon(Icons.eco_outlined),
            label: 'eco',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'person',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.video_camera_back),
            icon: Icon(Icons.video_camera_back_outlined),
            label: 'video',
          ),
        ],
      ),*/


    );
  }
}

