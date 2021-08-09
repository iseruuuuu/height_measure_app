import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String _location = "no data";

  String lati = '';
  String long = '';
  String alti = '';
  String dist = '';
  String bear = '';

  String lati2 = '';
  String long2 = '';
  String alti2 = '';
  String dist2 = '';
  String bear2 = '';

  String lati3 = '';
  String long3 = '';
  String alti3 = '';
  String dist3 = '';
  String bear3 = '';

  bool change = false;
  bool change2 = false;


  Future<void> getLocation() async {
    if(change == false) {
      // 現在の位置を返す
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      // 北緯がプラス。南緯がマイナス
      //print("緯度: " + position.latitude.toString());
      // 東経がプラス、西経がマイナス
      //print("経度: " + position.longitude.toString());
      // 高度
      //print("高度: " + position.altitude.toString());
      // 距離をメートルで返す
      double distanceInMeters =
      Geolocator.distanceBetween(35.68, 139.76, -23.61, -46.40);
      //print(distanceInMeters);
      // 方位を返す
      double bearing = Geolocator.bearingBetween(35.68, 139.76, -23.61, -46.40);
      //print(bearing);
      setState(() {
        _location = position.toString();
        //緯度
        lati = position.latitude.toString();
        //経度
        long = position.longitude.toString();
        //高度
        alti = position.altitude.toString();
        //距離をメートルで返す
        dist = '$distanceInMeters';
        //方位
        bear = '$bearing';
      });
    }else{
      setState(() {
        lati2 = lati;
        long2 = long;
        alti2 = alti;
        dist2 = dist;
        bear2 = bear;
      });
    }

    if(change2 == false) {
      print('うつすよ??');
    }else{
      setState(() {
        lati3 = lati + 'から' +  lati2;
        long3 = long + 'から' + long2;
        alti3 = alti + 'から' + alti2;
        dist3 = dist + 'から' + dist2;
        bear3 = bear + 'から' + bear2;


      });
    }
  }

  void tap() {
    change = !change;
    print(change);
  }

  void tap2() {
    change2 = !change2;
    print(change2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("緯度: " + lati),
            Text("経度: " + long),
            Text("高度: " + alti),
            Text("距離: " + dist),
            Text("方角: " + bear),

           const SizedBox(height: 50),

            Text("緯度: " + lati2),
            Text("経度: " + long2),
            Text("高度: " + alti2),
            Text("距離: " + dist2),
            Text("方角: " + bear2),

            const SizedBox(height: 50),


            Text("緯度: " + lati3),
            Text("経度: " + long3),
            Text("高度: " + alti3),
            Text("距離: " + dist3),
            Text("方角: " + bear3),



          ],
        ),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: () {
              tap();
            },
            child: const Icon(Icons.extension),
          ),
          Container( // 余白のためContainerでラップ
            margin: const EdgeInsets.only(bottom: 16.0),
            child:  FloatingActionButton(
              onPressed: getLocation,
              child: const Icon(Icons.location_on),
            ),
          ),

          Container( // 余白のためContainerでラップ
            margin: const EdgeInsets.only(bottom: 16.0),
            child:  FloatingActionButton(
              onPressed: () {
                tap2();
              },
              child: const Icon(Icons.camera),
            ),
          ),


        ],
      ),
    );
  }
}