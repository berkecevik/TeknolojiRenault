import 'package:flutter/material.dart';
import 'package:teknolojirenault/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class Barkod extends StatefulWidget{
  const Barkod ({Key? key}) : super (key: key);
  @override
  _BarkodState createState() => _BarkodState();
}

class _BarkodState extends State<Barkod> {
  String _scanBarcode = 'Tarama Yapılmadı';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'İptal', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'İptal', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'HATA';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'İptal', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'HATA';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              )
          ),
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Anasayfa')));
            },
        ),
              title: Text("Barkod/Qr ile Bul"),
            ),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      direction: Axis.vertical,

                      children: <Widget>[
                        ElevatedButton(
                            child: SizedBox(child:Text('Barkod ile Tara',textAlign: TextAlign.center,),width:300.0 ,height:20.0,),
                            onPressed: () => scanBarcodeNormal(),
                        ),
                        ElevatedButton(
                          child: SizedBox(child: Text('QR ile Tara',textAlign: TextAlign.center,),width: 300.0,height: 20.0,),
                            onPressed: () => scanQR(),
                        ),
                        Container(width: 280.0, height: 40.0,

              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              border: Border(
              top: BorderSide(width: 2.0, color: Colors.amber),
              left: BorderSide(width: 2.0, color: Colors.amber),
              right: BorderSide(width: 2.0, color: Colors.amber),
              bottom: BorderSide(width: 2.0, color: Colors.amber),
              )
              ),
                        child:Text('Sonuç : $_scanBarcode', textAlign: TextAlign.center,

                            style: TextStyle(fontSize: 19))
                        )
                      ]
                  )
              );
            }
            )
        )
    );
  }
}