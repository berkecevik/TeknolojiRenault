import 'package:flutter/material.dart';
import 'package:teknolojirenault/models/products.dart';
import 'package:teknolojirenault/helper/dbHelper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Products> allProducts = [];
  bool aktiflik = false;
  var _controllerTitle = TextEditingController();
  var _controllerDesc = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  late int clickedNoteID;

  void getProducts() async {
    var ProductsFuture = _databaseHelper.getAllProducts();
    await ProductsFuture.then((data) {
      setState(() {
        this.allProducts = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stok Kontrol"),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    buildForm(_controllerTitle, "Ürün Adı"),
                    buildForm(_controllerDesc, "Adet")
                  ])),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButton("Kaydet", Colors.green, saveObject),
                    buildButton("Güncelle", Colors.yellow, updateObject)
                  ]),
              Expanded(
                  child: ListView.builder(
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                                onTap: () {
                                  setState(() {
                                    _controllerTitle.text = allProducts[index].title!;
                                    _controllerDesc.text =
                                    allProducts[index].description!;
                                    clickedNoteID = allProducts[index].id!;
                                  });
                                },
                                title: Text(allProducts[index].title!),
                                subtitle: Text(allProducts[index].description!),
                                trailing: GestureDetector(
                                  onTap: () {
                                    _deleteNote(allProducts[index].id!, index);
                                  },
                                  child: Icon(Icons.delete),
                                )));
                      }))
            ])));
  }

  Widget buildForm(TextEditingController txtController, String str) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            autofocus: false,
            controller: txtController,
            decoration:
            InputDecoration(labelText: str, border: OutlineInputBorder())));
  }

  Widget buildButton(String str, Color buttonColor, Function eventFunc) {
    return RaisedButton(
      child: Text(str),
      color: buttonColor,
      onPressed: () {
        eventFunc();
      },
    );
  }

  void updateObject() {
    if (clickedNoteID != null) {
      if (_formKey.currentState!.validate()) {
        _uptadeNote(Products.withID(
            clickedNoteID, _controllerTitle.text, _controllerDesc.text));
      }
    } else {
      alert();
    }
  }

  void saveObject() {
    if (_formKey.currentState!.validate()) {
      _addNote(Products(_controllerTitle.text, _controllerDesc.text));
    }
  }

  void alert() {
    AlertDialog alert = AlertDialog(
      title: Text("SEÇİLİ ÜRÜN YOK!"),
      content: Text("Lütfen bir ürün seçerek güncelleme işlemi yapınız!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Crud İşlemlerinin AraYüze Uygulanması

  void _addNote(Products note) async {
    await _databaseHelper.insert(note);

    setState(() {
      getProducts();
      _controllerTitle.text = "";
      _controllerDesc.text = "";
    });
  }

  void _uptadeNote(Products note) async {
    await _databaseHelper.update(note);

    setState(() {
      getProducts();
      _controllerTitle.text = "";
      _controllerDesc.text = "";
      clickedNoteID = null as int;
    });
  }

  void _deleteNote(int deletedNoteId, int deletedNoteIndex) async {
    await _databaseHelper.delete(deletedNoteId);

    setState(() {
      getProducts();
    });
  }
}
