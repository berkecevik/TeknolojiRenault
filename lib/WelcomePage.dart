import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teknolojirenault/Login.dart';
import 'package:teknolojirenault/main.dart';
class WelcomePage extends StatelessWidget {
  String name;
  WelcomePage({Key? key,required this.name,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(margin: const EdgeInsets.only(top: 60),
                child:
              Image.asset("assets/reno.gif",
                height: 200.0,width: 200.0,
               ),
              ),
                Text('Aramıza\n Hoşgeldin\n $name', style: TextStyle(
                fontSize: 30,
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.black,
              ), textAlign: TextAlign.center,
              ),
              ElevatedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Anasayfaya Git'),
                    SizedBox(width: 10,),
                    Icon(Icons.add_to_home_screen_rounded,size: 24.0,)
                  ],
                ),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Anasayfa')));

              },
              )
            ],
          ),
        ),
      ),
    );
  }
}