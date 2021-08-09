import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:geolocator/geolocator.dart';
import 'package:math_expressions/math_expressions.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default('') String latitude,
    @Default('') String longitude,
    @Default('') String altitude,
    @Default('') String distanceInMeters,
    @Default('') String bearing,
  }) = _HomeScreenState;
}

class HomeScreenController extends StateNotifier<HomeScreenState> with LocatorMixin {
  HomeScreenController({
    required this.context,
  }) : super (const HomeScreenState());

  final BuildContext context;

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

  @override
  void initState() {
    super.initState();

  }

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
    }else{
      lati2 = lati;
      long2 = long;
      alti2 = alti;
      dist2 = dist;
      bear2 = bear;
    }

    if(change2 == false) {
    }else{
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

      state = state.copyWith(
        latitude: lati6,
        longitude: long6,
        altitude: alti6,
        distanceInMeters: dist6,
        bearing: bear6,
      );


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


}
