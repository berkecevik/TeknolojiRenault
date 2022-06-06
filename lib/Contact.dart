import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İletişim"),
      ),
        body: ContactUs(
            cardColor: Colors.amber,
            textColor: Colors.black,
            logo: AssetImage('assets/reno.gif'),
            email: 'nbcevik@hotmail.com',
            companyName: 'TeknolojiRenault',
            companyColor: Colors.black54,
            dividerThickness: 2,
            phoneNumber: '+905444288042',
            website: 'http://www.teknolojirenault.com/',
            tagLine: 'Araç Servis',
            taglineColor: Colors.black45,
            instagram: 'teknolojirenaultservis',
            ),
      );
  }
}