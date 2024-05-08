import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_guess_flutter/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}







class _TahminEkraniState extends State<TahminEkrani> {


  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";


  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);//0-100 arasında toplam 101 sayı var.
    print("Rastgele Sayı : $rastgeleSayi");/*Her "Oyuna Başla"
    butonuna tıklandığında, çıktıda rastgele 0-100 arası bir sayı verilecek.*/
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.indigo,

      appBar: AppBar(
        backgroundColor: Colors.pink,
        title:  const Text("Tahmin Ekranı"),
      ),



      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:   <Widget>[



            Text(
              "Kalan Hak : $kalanHak",
              style: TextStyle(
                color: Colors.pink.shade200,
                fontSize: 31,
              ),
            ),



             Text(
              "Yardım : $yonlendirme  dermem lazım",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),



             Padding(
              padding:  const EdgeInsets.all(14.0),
              child:  TextField(
                controller: tfTahmin,//Textfield içine girdiğim bilgiyi bana iletecek.
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.indigo,
                ),
                decoration: InputDecoration(
                  hintText: "Sayı Giriniz",
                  hintStyle: const TextStyle(
                    color: Colors.indigo,
                  ),
                  labelText: "Tahmin",
                  labelStyle: const TextStyle(
                    color: Colors.indigo,
                  ),
                  filled: true,
                  fillColor: Colors.pink.shade200,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(11),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.numbers,
                    color: Colors.indigo,
                  ),
                ),
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

                  setState(() {
                    kalanHak = kalanHak-1;
                  });

                  int tahmin =int.parse(tfTahmin.text);//tf içine yazılan bilgiyi bana integer türünden vermesi lazım.


                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(//Back Stack için, yani bundan sonraki sayfadan sonra anasayfaya dönmek için
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  SonucEkrani(sonuc: true,),//kazandınız
                        ),
                    );
                    return;
                  }



                  if(tahmin > rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  }



                  if(tahmin < rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }


                  if(kalanHak == 0){
                    Navigator.pushReplacement(//Back Stack için, yani bundan sonraki sayfadan sonra anasayfaya dönmek için
                      context,
                      MaterialPageRoute(builder: (context) =>  SonucEkrani(sonuc: false,),),//kaybettiniz
                    );
                  }

                  /*if(kalanHak < 0){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Anasayfa()));
                  }*/

                  tfTahmin.text = "";//her işlem sonunda içini boşaltacak.

                },
                child: const Text(
                 "Tahmin Et",
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
