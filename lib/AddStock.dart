import 'package:flutter/material.dart';
import 'package:teknolojirenault/CheckStock.dart';
import 'package:teknolojirenault/WelcomePage.dart';
import 'package:teknolojirenault/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class Stokekle extends StatefulWidget{
  const Stokekle ({Key? key}) : super (key: key);
  @override
  _StokekleState createState() => _StokekleState();
}

class _StokekleState extends State<Stokekle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Anasayfa')));
          },
        ),
        centerTitle: true,
        title: Text("Stok Ekle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                labelText: 'Ürün Adını Giriniz'
                ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adet Sayısı Giriniz'
                ),
              ),
            ),
            ElevatedButton
              (child: Text("Ekle"),
              onPressed: () => _onBasicAlertPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}

_onBasicAlertPressed(context) {
  Alert(
    context: context,
    type: AlertType.success,
    desc: "Ürün Başarıyla Eklendi",
    buttons: [
    DialogButton(
      child: Text(
        "TAMAM",
        style: TextStyle(color: Colors.white, fontSize: 19),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Stokekle()));
      },
      width: 90,
    ),
  ],
)
     .show();
}
