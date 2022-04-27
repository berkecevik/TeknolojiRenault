import 'package:flutter/material.dart';
import 'package:teknolojirenault/Login.dart';
import 'package:teknolojirenault/Settings.dart';
import 'package:teknolojirenault/CheckStock.dart';
import 'package:teknolojirenault/AddStock.dart';
import 'package:teknolojirenault/Appointments.dart';
import 'package:teknolojirenault/Barkod.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
          )
        ),
        primarySwatch: Colors.amber,
      ),
      home: const Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  get teknolojirenault => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset('assets/tekno1.jpg', fit: BoxFit.contain, height: 60,width: 350,),
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            ElevatedButton(
                child: SizedBox(child:Text('Stok Kontrol',textAlign: TextAlign.center,),width:300.0 ,height:20.0,),

              onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Stokkontrol()));
                }
            ),
            ElevatedButton(
                child: SizedBox(child:Text('Stok Ekle',textAlign: TextAlign.center,),width:300.0 ,height:20.0,),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Stokekle()));
                }
            )
            ,
            ElevatedButton(
                child: SizedBox(child:Text('Randevularım',textAlign: TextAlign.center,),width:300.0 ,height:20.0,),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Randevular()));
                }
            )
            ,
            ElevatedButton(
                child: SizedBox(child:Text('Barkod kodu gir',textAlign: TextAlign.center,),width:300.0 ,height:20.0,),
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Barkod()));
                }
            )
            ,
            ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Uygulama Ayarları'),
                SizedBox(width: 20.0, height: 20.0,),
                Icon(Icons.settings,size: 24.0,)
              ],
            )
                ,onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                }
            ),
            ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Çıkış Yap'),
                    SizedBox(width: 10,),
                    Icon(Icons.exit_to_app,size: 24.0,)
                  ],
                ),
                onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            }
            )
          ],
        ),


      ),

      );

  }
}
