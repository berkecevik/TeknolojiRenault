import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teknolojirenault/Register.dart';
import 'package:teknolojirenault/main.dart';
class Login extends StatefulWidget{
  const Login ({Key? key}) : super (key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Giriş Yap", textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
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
            FlatButton(
              onPressed: (){
                //henüz yapmadım...
              },
              child: Text(
                'Şifremi Unuttum',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Anasayfa',)));
                },
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                'Henüz bir hesabın yok mu?',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}