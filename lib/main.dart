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


  Future<void> getLocation() async {
    // 現在の位置を返す
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // 北緯がプラス。南緯がマイナス
    print("緯度: " + position.latitude.toString());
    // 東経がプラス、西経がマイナス
    print("経度: " + position.longitude.toString());
    // 高度
    print("高度: " + position.altitude.toString());
    // 距離をメートルで返す
    double distanceInMeters =
    Geolocator.distanceBetween(35.68, 139.76, -23.61, -46.40);
    print(distanceInMeters);
    // 方位を返す
    double bearing = Geolocator.bearingBetween(35.68, 139.76, -23.61, -46.40);
    print(bearing);
    setState(() {
      _location = position.toString();
      //TODO 後で整理
      lati = position.latitude.toString();
      long = position.longitude.toString();
      dist = position.altitude.toString();
      bear = '$distanceInMeters';
      bear = '$bearing';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('aaa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("緯度: " + lati),
            Text("経度: " + long),
            Text("高度: " + alti),
            Text("高度: " + dist),
            Text("方角: " + bear),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getLocation, child: Icon(Icons.location_on)),
    );
  }
}