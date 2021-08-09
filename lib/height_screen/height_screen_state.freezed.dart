// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'height_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HeightScreenStateTearOff {
  const _$HeightScreenStateTearOff();

  _HeightScreenState call(
      {String altitude = '', String altitude2 = '', String altitude3 = ''}) {
    return _HeightScreenState(
      altitude: altitude,
      altitude2: altitude2,
      altitude3: altitude3,
    );
  }
}

/// @nodoc
const $HeightScreenState = _$HeightScreenStateTearOff();

/// @nodoc
mixin _$HeightScreenState {
  String get altitude => throw _privateConstructorUsedError;
  String get altitude2 => throw _privateConstructorUsedError;
  String get altitude3 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HeightScreenStateCopyWith<HeightScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeightScreenStateCopyWith<$Res> {
  factory $HeightScreenStateCopyWith(
          HeightScreenState value, $Res Function(HeightScreenState) then) =
      _$HeightScreenStateCopyWithImpl<$Res>;
  $Res call({String altitude, String altitude2, String altitude3});
}

/// @nodoc
class _$HeightScreenStateCopyWithImpl<$Res>
    implements $HeightScreenStateCopyWith<$Res> {
  _$HeightScreenStateCopyWithImpl(this._value, this._then);

  final HeightScreenState _value;
  // ignore: unused_field
  final $Res Function(HeightScreenState) _then;

  @override
  $Res call({
    Object? altitude = freezed,
    Object? altitude2 = freezed,
    Object? altitude3 = freezed,
  }) {
    return _then(_value.copyWith(
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as String,
      altitude2: altitude2 == freezed
          ? _value.altitude2
          : altitude2 // ignore: cast_nullable_to_non_nullable
              as String,
      altitude3: altitude3 == freezed
          ? _value.altitude3
          : altitude3 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$HeightScreenStateCopyWith<$Res>
    implements $HeightScreenStateCopyWith<$Res> {
  factory _$HeightScreenStateCopyWith(
          _HeightScreenState value, $Res Function(_HeightScreenState) then) =
      __$HeightScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({String altitude, String altitude2, String altitude3});
}

/// @nodoc
class __$HeightScreenStateCopyWithImpl<$Res>
    extends _$HeightScreenStateCopyWithImpl<$Res>
    implements _$HeightScreenStateCopyWith<$Res> {
  __$HeightScreenStateCopyWithImpl(
      _HeightScreenState _value, $Res Function(_HeightScreenState) _then)
      : super(_value, (v) => _then(v as _HeightScreenState));

  @override
  _HeightScreenState get _value => super._value as _HeightScreenState;

  @override
  $Res call({
    Object? altitude = freezed,
    Object? altitude2 = freezed,
    Object? altitude3 = freezed,
  }) {
    return _then(_HeightScreenState(
      altitude: altitude == freezed
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as String,
      altitude2: altitude2 == freezed
          ? _value.altitude2
          : altitude2 // ignore: cast_nullable_to_non_nullable
              as String,
      altitude3: altitude3 == freezed
          ? _value.altitude3
          : altitude3 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HeightScreenState implements _HeightScreenState {
  const _$_HeightScreenState(
      {this.altitude = '', this.altitude2 = '', this.altitude3 = ''});

  @JsonKey(defaultValue: '')
  @override
  final String altitude;
  @JsonKey(defaultValue: '')
  @override
  final String altitude2;
  @JsonKey(defaultValue: '')
  @override
  final String altitude3;

  @override
  String toString() {
    return 'HeightScreenState(altitude: $altitude, altitude2: $altitude2, altitude3: $altitude3)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HeightScreenState &&
            (identical(other.altitude, altitude) ||
                const DeepCollectionEquality()
                    .equals(other.altitude, altitude)) &&
            (identical(other.altitude2, altitude2) ||
                const DeepCollectionEquality()
                    .equals(other.altitude2, altitude2)) &&
            (identical(other.altitude3, altitude3) ||
                const DeepCollectionEquality()
                    .equals(other.altitude3, altitude3)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(altitude) ^
      const DeepCollectionEquality().hash(altitude2) ^
      const DeepCollectionEquality().hash(altitude3);

  @JsonKey(ignore: true)
  @override
  _$HeightScreenStateCopyWith<_HeightScreenState> get copyWith =>
      __$HeightScreenStateCopyWithImpl<_HeightScreenState>(this, _$identity);
}

abstract class _HeightScreenState implements HeightScreenState {
  const factory _HeightScreenState(
      {String altitude,
      String altitude2,
      String altitude3}) = _$_HeightScreenState;

  @override
  String get altitude => throw _privateConstructorUsedError;
  @override
  String get altitude2 => throw _privateConstructorUsedError;
  @override
  String get altitude3 => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HeightScreenStateCopyWith<_HeightScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
