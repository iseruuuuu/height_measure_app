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

    @Default('') String latitude2,
    @Default('') String longitude2,
    @Default('') String altitude2,
    @Default('') String distanceInMeters2,
    @Default('') String bearing2,

    @Default('') String latitude3,
    @Default('') String longitude3,
    @Default('') String altitude3,
    @Default('') String distanceInMeters3,
    @Default('') String bearing3,
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
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      double distanceInMeters = Geolocator.distanceBetween(35.68, 139.76, -23.61, -46.40);
      double bearing = Geolocator.bearingBetween(35.68, 139.76, -23.61, -46.40);
      lati = position.latitude.toString();
      long = position.longitude.toString();
      alti = position.altitude.toString();
      dist = '$distanceInMeters';
      bear = '$bearing';

      state = state.copyWith(
        latitude: lati,
        longitude: long,
        altitude: alti,
        distanceInMeters: dist,
        bearing: bear,
      );

    }else{
      lati2 = lati;
      long2 = long;
      alti2 = alti;
      dist2 = dist;
      bear2 = bear;

      state = state.copyWith(
        latitude2: lati2,
        longitude2: long2,
        altitude2: alti2,
        distanceInMeters2: dist2,
        bearing2: bear2,
      );
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
        latitude3: lati6,
        longitude3: long6,
        altitude3: alti6,
        distanceInMeters3: dist6,
        bearing3: bear6,
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
