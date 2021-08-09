import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'height_screen_state.freezed.dart';

@freezed
abstract class HeightScreenState with _$HeightScreenState {
  const factory HeightScreenState({
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
  }) = _HeightScreenState;
}

class HeightScreenController extends StateNotifier<HeightScreenState> with LocatorMixin {
  HeightScreenController({
    required this.context,
  }) : super (const HeightScreenState());

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

  bool change = false;
  bool change2 = false;

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
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
        altitude: position.altitude.toString(),
        distanceInMeters: '$distanceInMeters',
        bearing: '$bearing',
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
      Parser p = Parser();
      Expression exp = p.parse(lati + '-' + lati2);
      Expression exp2 = p.parse(long + '-' + long2);
      Expression exp3 = p.parse(alti + '-' + alti2);
      Expression exp4 = p.parse(dist + '-' + dist2);
      Expression exp5 = p.parse(bear + '-' + bear2);
      ContextModel cm = ContextModel();

      state = state.copyWith(
        latitude3: exp.evaluate(EvaluationType.REAL, cm).toString(),
        longitude3:exp2.evaluate(EvaluationType.REAL, cm).toString(),
        altitude3: exp3.evaluate(EvaluationType.REAL, cm).toString(),
        distanceInMeters3: exp4.evaluate(EvaluationType.REAL, cm).toString(),
        bearing3: exp5.evaluate(EvaluationType.REAL, cm).toString(),
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
