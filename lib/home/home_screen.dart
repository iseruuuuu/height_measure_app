import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

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

  String lati4 = '';
  String long4 = '';
  String alti4 = '';
  String dist4 = '';
  String bear4 = '';

  String lati6 = '';
  String long6 = '';
  String alti6 = '';
  String dist6 = '';
  String bear6 = '';

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
      double distanceInMeters = Geolocator.distanceBetween(35.68, 139.76, -23.61, -46.40);
      //print(distanceInMeters);
      // 方位を返す
      double bearing = Geolocator.bearingBetween(35.68, 139.76, -23.61, -46.40);
      //print(bearing);
      setState(() {
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

    }else{
      setState(() {
        lati4 = lati + '-' + lati2;
        long4 = long + '-' + long2;
        alti4 = alti + '-' + alti2;
        dist4 = dist + '-' + dist2;
        bear4 = bear + '-' + bear2;

        Parser p = Parser();
        Expression exp = p.parse(lati4);
        Expression exp2 = p.parse(long4);
        Expression exp3 = p.parse(alti4);
        Expression exp4 = p.parse(dist4);
        Expression exp5 = p.parse(bear4);
        ContextModel cm = ContextModel();

        lati6 = exp.evaluate(EvaluationType.REAL, cm).toString();
        long6 = exp2.evaluate(EvaluationType.REAL, cm).toString();
        alti6 = exp3.evaluate(EvaluationType.REAL, cm).toString();
        dist6 = exp4.evaluate(EvaluationType.REAL, cm).toString();
        bear6 = exp5.evaluate(EvaluationType.REAL, cm).toString();

        print(lati6);
        print(long6);
        print(alti6);
        print(dist6);
        print(bear6);
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
      appBar: AppBar(
        title: Text('Home_Screen'),
      ),
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

            Text("緯度: " + lati6),
            Text("経度: " + long6),
            Text("高度: " + alti6),
            Text("距離: " + dist6),
            Text("方角: " + bear6),
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
            child: const Text('1'),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child:  FloatingActionButton(
              onPressed: getLocation,
              child: const Icon(Icons.location_on),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child:  FloatingActionButton(
              onPressed: () {
                tap2();
              },
              child: const Text('2'),
            ),
          ),
        ],
      ),
    );
  }
}