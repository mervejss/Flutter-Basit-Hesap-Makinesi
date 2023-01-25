import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hesap Makinesi",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        shadowColor: Colors.cyan,
        title: Text("Basit Hesap Makinesi"),
        centerTitle: true,
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}
//Icons.cancel remove clear_outlined do_disturb_on

class _AnaEkranState extends State<AnaEkran> {
  num sayi1 = 0, sayi2 = 0, sonuc = 0;
  TextEditingController tec1 = TextEditingController(text: "0");
  TextEditingController tec2 = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlueAccent,
        boxShadow:
        const [BoxShadow(
            color: Colors.cyan,
            spreadRadius: 10,
            blurRadius: 10)
        ],
      ),
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(

          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded(child: Text("SONUÇ : " + sonuc.toString(),style: TextStyle(color: Colors.redAccent[700],fontWeight: FontWeight.bold,fontSize: 20))),
            Expanded(flex:1,child: TextField(controller: tec1, keyboardType: TextInputType.number,
                onTap: () {
                  setState(() {
                    tec1.text = "";
                  });
                }, )),
            Expanded(flex:1,child: TextField(controller: tec2, keyboardType: TextInputType.number,onTap: () {
              setState(() {
                tec2.text = "";
              });
            }, )),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(shadowColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
                  onPressed: ()
                  {
                    Hesapla("+");
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add, size: 35, color: Colors.black),
                        SizedBox(
                          height: 5,
                          width: 15,
                        ),
                        Text(
                          "TOPLA",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 1,
                height: 1,
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  style: ButtonStyle(shadowColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
                  onPressed: () { Hesapla("-");},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.remove, size: 35, color: Colors.black),
                        SizedBox(
                          height: 5,
                          width: 15,
                        ),
                        Text(
                          "ÇIKAR",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 1,
                height: 1,
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  style: ButtonStyle(shadowColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
                  onPressed: () { Hesapla("*");},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.clear_outlined, size: 35, color: Colors.black),
                        SizedBox(
                          height: 5,
                          width: 15,
                        ),
                        Text(
                          "ÇARP",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 1,
                height: 1,
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  style: ButtonStyle(shadowColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
                  onPressed: () { Hesapla("/");},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "÷",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                          width: 30,
                        ),
                        Text(
                          "BÖL",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
            ),
          ],
        ),
      ),
    );
  }

  void Hesapla(String s)
  {
    sayi1=num.parse(tec1.text);
    sayi2=num.parse(tec2.text);
    setState(() {
        if(s=="+")
        {
          sonuc=sayi1+sayi2;
          print(sonuc);
        }
        else if(s=="-")
        {
          sonuc=sayi1-sayi2;
          print(sonuc);

        }
        else if(s=="*")
        {
          sonuc=sayi1*sayi2;
          print(sonuc);

        }
        else if(s=="/")
        {
          sonuc=sayi1/sayi2;
          print(sonuc);
        }
    });
  }
}
