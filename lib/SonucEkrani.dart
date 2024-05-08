import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;

  SonucEkrani({ required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,

      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Sonuç Ekranı"),
      ),



      body: Center(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[



            Padding(
              padding: const EdgeInsets.all(17.0),
              child: SizedBox(
                width: 170,
                height: 170,
                child: widget.sonuc ? /*true*/ Image.asset("fotolar/success.png")  :  /*false*/ Image.asset("fotolar/sad.png"),
              ),
            ),




            Text(
              widget.sonuc ? /*true*/ "Kazandınız!"   :    /*false*/"Kaybettiniz!",
              style: TextStyle(
                color: Colors.pink.shade200,
                fontSize: 31,
              ),
            ),








            SizedBox(
              width: 200,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade200,
                  foregroundColor: Colors.indigo,//hemen aşağıdaki Text'in rengi
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("Yeni Oyun",
                style:  TextStyle(
                  fontSize: 17,
                ),
              ),
              ),
            ),






          ],
        ),
      ),

    );
  }
}
