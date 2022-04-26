import 'package:flutter/material.dart';
import 'package:teknolojirenault/Login.dart';
import 'package:teknolojirenault/WelcomePage.dart';
class Register extends StatefulWidget{
  const Register ({Key? key}) : super (key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kayıt Ol"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/tekno1.jpg')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ad Soyad',
                    //hintText: ''
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Örn:asdasd@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                    hintText: 'Şifrenizi Giriniz'),
              ),
            ),
            Container(
              margin: new EdgeInsets.only(top: 20.0),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => WelcomePage(name: _name.text)));
                },
                child: Text(
                  'Kayıt Ol',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                'Zaten hesabın var mı??',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}