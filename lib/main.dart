import 'package:flutter/material.dart';
import 'package:number_guess_flutter/TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:  const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,


      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),




      body: Center(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,//dikeyde componentler arası boşluk bıraktırır.
          children:  <Widget>[




            Text(
              "Tahmin Oyunu",
               style: TextStyle(
                 color: Colors.blueAccent.shade100,
                 fontSize: 31,
            ),
            ),




            Padding(
              padding: const EdgeInsets.all(17.0),
              child: SizedBox(
                  width: 170,
                  height: 170,
                  child: Image.asset("fotolar/zar.png"),
              ),
            ),

            



            SizedBox(
              width: 200,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.pinkAccent.shade100,//hemen aşağıdaki Text'in rengi
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TahminEkrani(),),
                  );
                }, child: const Text(
                "Oyuna Başla",
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
