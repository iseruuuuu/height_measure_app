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
    @Default('') String altitude,

    @Default('') String altitude2,

    @Default('') String altitude3,

  }) = _HeightScreenState;
}

class HeightScreenController extends StateNotifier<HeightScreenState> with LocatorMixin {
  HeightScreenController({
    required this.context,
  }) : super (const HeightScreenState());

  final BuildContext context;

  String alti = '';
  String alti2 = '';
  bool change = false;
  bool change2 = false;

  Future<void> getLocation() async {
    if(change == false) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      double distanceInMeters = Geolocator.distanceBetween(35.68, 139.76, -23.61, -46.40);
      double bearing = Geolocator.bearingBetween(35.68, 139.76, -23.61, -46.40);
      alti = position.altitude.toString();
      state = state.copyWith(
        altitude: position.altitude.toString(),
      );
    }else{
      alti2 = alti;
      state = state.copyWith(
        altitude2: alti2,
      );
    }
    if(change2 == false) {
    }else{
      Parser p = Parser();
      Expression exp3 = p.parse(alti + '-' + alti2);
      ContextModel cm = ContextModel();

      state = state.copyWith(
        altitude3: exp3.evaluate(EvaluationType.REAL, cm).toString(),
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

  void reset() {
    state = state.copyWith(
      altitude: '',
      altitude2: '',
      altitude3: '',
    );
  }


}
